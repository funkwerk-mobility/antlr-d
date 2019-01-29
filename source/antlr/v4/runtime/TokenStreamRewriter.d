/*
 * Copyright (c) 2012-2019 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.TokenStreamRewriter;

import antlr.v4.runtime.IllegalArgumentException;
import antlr.v4.runtime.InsertAfterOp;
import antlr.v4.runtime.InsertBeforeOp;
import antlr.v4.runtime.ReplaceOp;
import antlr.v4.runtime.RewriteOperation;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenConstantDefinition;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.misc.Interval;
import std.algorithm.comparison;
import std.format;
import std.conv;

/**
 * Useful for rewriting out a buffered input token stream after doing some
 * augmentation or other manipulations on it.
 *
 * <p>
 * You can insert stuff, replace, and delete chunks. Note that the operations
 * are done lazily--only if you convert the buffer to a {@link String} with
 * {@link TokenStream#getText()}. This is very efficient because you are not
 * moving data around all the time. As the buffer of tokens is converted to
 * strings, the {@link #getText()} method(s) scan the input token stream and
 * check to see if there is an operation at the current index. If so, the
 * operation is done and then normal {@link String} rendering continues on the
 * buffer. This is like having multiple Turing machine instruction streams
 * (programs) operating on a single input tape. :)</p>
 *
 * <p>
 * This rewriter makes no modifications to the token stream. It does not ask the
 * stream to fill itself up nor does it advance the input cursor. The token
 * stream {@link TokenStream#index()} will return the same value before and
 * after any {@link #getText()} call.</p>
 *
 * <p>
 * The rewriter only works on tokens that you have in the buffer and ignores the
 * current input cursor. If you are buffering tokens on-demand, calling
 * {@link #getText()} halfway through the input will only do rewrites for those
 * tokens in the first half of the file.</p>
 *
 * <p>
 * Since the operations are done lazily at {@link #getText}-time, operations do
 * not screw up the token index values. That is, an insert operation at token
 * index {@code i} does not change the index values for tokens
 * {@code i}+1..n-1.</p>
 *
 * <p>
 * Because operations never actually alter the buffer, you may always get the
 * original token stream back without undoing anything. Since the instructions
 * are queued up, you can easily simulate transactions and roll back any changes
 * if there is an error just by removing instructions. For example,</p>
 *
 * <pre>
 * CharStream input = new ANTLRFileStream("input");
 * TLexer lex = new TLexer(input);
 * CommonTokenStream tokens = new CommonTokenStream(lex);
 * T parser = new T(tokens);
 * TokenStreamRewriter rewriter = new TokenStreamRewriter(tokens);
 * parser.startRule();
 * </pre>
 *
 * <p>
 * Then in the rules, you can execute (assuming rewriter is visible):</p>
 *
 * <pre>
 * Token t,u;
 * ...
 * rewriter.insertAfter(t, "text to put after t");}
 * rewriter.insertAfter(u, "text after u");}
 * System.out.println(rewriter.getText());
 * </pre>
 *
 * <p>
 * You can also have multiple "instruction streams" and get multiple rewrites
 * from a single pass over the input. Just name the instruction streams and use
 * that name again when printing the buffer. This could be useful for generating
 * a C file and also its header file--all from the same buffer:</p>
 *
 * <pre>
 * rewriter.insertAfter("pass1", t, "text to put after t");}
 * rewriter.insertAfter("pass2", u, "text after u");}
 * System.out.println(rewriter.getText("pass1"));
 * System.out.println(rewriter.getText("pass2"));
 * </pre>
 *
 * <p>
 * If you don't use named rewrite streams, a "default" stream is used as the
 * first example shows.</p>
 */
class TokenStreamRewriter
{

    public static immutable string DEFAULT_PROGRAM_NAME = "default";

    public static immutable int MIN_TOKEN_INDEX = 0;

    /**
     * Our source stream
     * @uml
     * @read
     */
    private static TokenStream tokens_;

    protected RewriteOperation[][string] programs;

    protected size_t[string] lastRewriteTokenIndexes;

    private RewriteOperation[] rewriteOps;

    public this()
    {
    }

    public this(TokenStream tokens)
    {
        tokens_ = tokens;
        programs[DEFAULT_PROGRAM_NAME] = rewriteOps;
    }

    public void rollback(int instructionIndex)
    {
        rollback(DEFAULT_PROGRAM_NAME, instructionIndex);
    }

    /**
     * Rollback the instruction stream for a program so that
     *  the indicated instruction (via instructionIndex) is no
     *  longer in the stream. UNTESTED!
     */
    public void rollback(string programName, int instructionIndex)
    {
        RewriteOperation[] ist = programs[programName];
        if (programName in programs) {
            programs[programName] = programs[programName][MIN_TOKEN_INDEX .. instructionIndex];
        }
    }

    public void deleteProgram()
    {
        deleteProgram(DEFAULT_PROGRAM_NAME);
    }

    /**
     * Reset the program so that no instructions exist
     */
    public void deleteProgram(string programName)
    {
        rollback(programName, MIN_TOKEN_INDEX);
    }

    public void insertAfter(Token t, string text)
    {
        insertAfter(DEFAULT_PROGRAM_NAME, t, text);
    }

    public void insertAfter(int index, string text)
    {
        insertAfter(DEFAULT_PROGRAM_NAME, index, text);
    }

    public void insertAfter(string programName, Token t, string text)
    {
        insertAfter(programName, t.getTokenIndex, text);
    }

    public void insertAfter(string programName, int index, string text)
    {
        // to insert after, just insert before next index (even if past end)
        RewriteOperation op = new InsertAfterOp(index, text);
        op.instructionIndex = programs[programName].length;
        programs[programName] ~= op;
    }

    public void insertBefore(Token t, string text)
    {
        insertBefore(DEFAULT_PROGRAM_NAME, t, text);
    }

    public void insertBefore(size_t index, string text)
    {
        insertBefore(DEFAULT_PROGRAM_NAME, index, text);
    }

    public void insertBefore(string programName, Token t, string text)
    {
        insertBefore(programName, t.getTokenIndex(), text);
    }

    public void insertBefore(string programName, size_t index, string text)
    {
        RewriteOperation op = new InsertBeforeOp(index, text);
        op.instructionIndex = programs[programName].length;
        programs[programName] ~= op;
    }

    public void replace(size_t index, string text)
    {
        replace(DEFAULT_PROGRAM_NAME, index, index, text);
    }

    public void replace(size_t from, size_t to, string text)
    {
        replace(DEFAULT_PROGRAM_NAME, from, to, text);
    }

    public void replace(Token indexT, string text)
    {
        replace(DEFAULT_PROGRAM_NAME, indexT, indexT, text);
    }

    public void replace(Token from, Token to, string text)
    {
        replace(DEFAULT_PROGRAM_NAME, from, to, text);
    }

    public void replace(string programName, size_t from, size_t to, string text)
    {
        if ( from > to || from<0 || to<0 || to >= tokens_.size ) {
            throw
                new
                IllegalArgumentException(
                                         format("replace: range invalid: %s..%s(size=%s)",
                                                from, to, tokens_.size));
        }
        RewriteOperation op = new ReplaceOp(from, to, text);
        RewriteOperation[] rewrites = getProgram(programName);
        op.instructionIndex = rewrites.length;
        rewrites ~= op;
    }

    public void replace(string programName, Token from, Token to, string text)
    {
        replace(programName,
                from.getTokenIndex,
                to.getTokenIndex,
                text);
    }

    /**
     * Delete token (can not use delete as identifier)
     */
    public void deleteT(size_t index)
    {
        deleteT(DEFAULT_PROGRAM_NAME, index, index);
    }

    public void deleteT(size_t from, size_t to)
    {
        deleteT(DEFAULT_PROGRAM_NAME, from, to);
    }

    public void deleteT(Token indexT)
    {
        deleteT(DEFAULT_PROGRAM_NAME, indexT, indexT);
    }

    public void deleteT(Token from, Token to)
    {
        deleteT(DEFAULT_PROGRAM_NAME, from, to);
    }

    public void deleteT(string programName, size_t from, size_t to)
    {
        replace(programName,from,to,null);
    }

    public void deleteT(string programName, Token from, Token to)
    {
        replace(programName,from,to,null);
    }

    public size_t getLastRewriteTokenIndex()
    {
        return getLastRewriteTokenIndex(DEFAULT_PROGRAM_NAME);
    }

    private size_t getLastRewriteTokenIndex(string programName)
    {
        if (programName in lastRewriteTokenIndexes) {
            return lastRewriteTokenIndexes[programName];
        }
        else {
            return -1;
        }
    }

    private void setLastRewriteTokenIndex(string programName, size_t i)
    {
        lastRewriteTokenIndexes[programName] =  i;
    }

    private RewriteOperation[] getProgram(string name)
    {
        if (name in programs) {
            return programs[name];
        }
        else {
            return initializeProgram(name);
        }
    }

    private RewriteOperation[] initializeProgram(string name)
    {
        RewriteOperation[] iso;
        programs[name] = iso;
        return iso;
    }

    /**
     * Return the text from the original tokens altered per the
     *  instructions given to this rewriter.
     */
    public string getText()
    {
        return getText(DEFAULT_PROGRAM_NAME, Interval.of(0,tokens_.size()-1));
    }

    /**
     * Return the text from the original tokens altered per the
     *  instructions given to this rewriter in programName.
     */
    public string getText(string programName)
    {
        return getText(programName, Interval.of(0,tokens_.size-1));
    }

    /**
     * Return the text associated with the tokens in the interval from the
     *  original token stream but with the alterations given to this rewriter.
     *  The interval refers to the indexes in the original token stream.
     *  We do not alter the token stream in any way, so the indexes
     *  and intervals are still consistent. Includes any operations done
     *  to the first and last token in the interval. So, if you did an
     *  insertBefore on the first token, you would get that insertion.
     *  The same is true if you do an insertAfter the stop token.
     */
    public string getText(Interval interval)
    {
        return getText(DEFAULT_PROGRAM_NAME, interval);
    }

    public string getText(string programName, Interval interval)
    {
        RewriteOperation[] rewrites;

        if (programName in programs)
            rewrites = programs[programName];

        int start = interval.a;
        int stop = interval.b;

        // ensure start/end are in range
        if ( stop > tokens_.size-1 )
            stop = tokens_.size-1;
        if ( start < 0 )
            start = 0;
        if (rewrites.length == 0) {
            return tokens_.getText(interval); // no instructions to execute
        }
        debug(TokenStreamRewriter) {
            import std.stdio : writefln;
            writefln("getText(string programName, Interval interval = %s) = %s", interval, tokens_.getText(interval));
        }
        string buf;

        // First, optimize instruction stream
        RewriteOperation[size_t] indexToOp = reduceToSingleOperationPerIndex(rewrites);

        // Walk buffer, executing instructions and emitting tokens
        int i = start;
        debug(TokenStreamRewriter) {
            import std.stdio : writefln;
            writefln("indexToOp = % s, start = index = %s, stop = %s, size = %s",indexToOp, i, stop, tokens_.size);
        }
        while (i <= stop && i < tokens_.size) {
            debug(TokenStreamRewriter) {
                import std.stdio : writefln;
                writefln("xxx index = %s", i);
            }
            Token t = tokens_.get(i);
            if (!(i in indexToOp)) {
                // no operation at that index, just dump token
                if (t.getType != TokenConstantDefinition.EOF)
                    buf ~= t.getText;
                i++; // move to ne xt token
                debug(TokenStreamRewriter) {
                    import std.stdio : writefln;
                    writefln("no operation buf = %s, i = %s", buf, i);
                }
            }
            else {
                debug(TokenStreamRewriter) {
                    import std.stdio : writefln;
                    writefln("before execute buf = %s, i = %s", buf, i);
                }
                i = to!int(indexToOp[i].execute(buf)); // execute operation and skip
                indexToOp.remove(i); // remove so any left have index size-1
            }
        }

        // include stuff after end if it's last index in buffer
        // So, if they did an insertAfter(lastValidIndex, "foo"), include
        // foo if end==lastValidIndex.
        if (stop == tokens_.size()-1) {
            // Scan any remaining operations after last token
            // should be included (they will be inserts).
            foreach (RewriteOperation op; indexToOp.values()) {
                if (op.index >= tokens_.size-1)
                    buf ~= to!string(op.text);
            }
        }
        return buf;
    }

    /**
     *  overlapping replaces that are not completed nested). Inserts to
     *  same index need to be combined etc...  Here are the cases:
     *
     *  I.i.u I.j.v								leave alone, nonoverlapping
     *  I.i.u I.i.v								combine: Iivu
     *
     *  R.i-j.u R.x-y.v	| i-j in x-y			delete first R
     *  R.i-j.u R.i-j.v							delete first R
     *  R.i-j.u R.x-y.v	| x-y in i-j			ERROR
     *  R.i-j.u R.x-y.v	| boundaries overlap	ERROR
     *
     *  Delete special case of replace (text==null):
     *  D.i-j.u D.x-y.v	| boundaries overlap	combine to max(min)..max(right)
     *
     *  I.i.u R.x-y.v | i in (x+1)-y			delete I (since insert before
     *											we're not deleting i)
     *  I.i.u R.x-y.v | i not in (x+1)-y		leave alone, nonoverlapping
     *  R.x-y.v I.i.u | i in x-y				ERROR
     *  R.x-y.v I.x.u 							R.x-y.uv (combine, delete I)
     *  R.x-y.v I.i.u | i not in x-y			leave alone, nonoverlapping
     *
     *  I.i.u = insert u before op @ index i
     *  R.x-y.u = replace x-y indexed tokens with u
     *
     *  First we need to examine replaces. For any replace op:
     *
     * 		1. wipe out any insertions before op within that range.
     *		2. Drop any replace op before that is contained completely within
     *	 that range.
     *		3. Throw exception upon boundary overlap with any previous replace.
     *
     *  Then we can deal with inserts:
     *
     * 		1. for any inserts to same index, combine even if not adjacent.
     * 		2. for any prior replace with same left boundary, combine this
     *	 insert with replace and delete this replace.
     * 		3. throw exception if index in same range as previous replace
     *
     *  Don't actually delete; make op null in list. Easier to walk list.
     *  Later we can throw as we add to index &rarr; op map.
     *
     *  Note that I.2 R.2-2 will wipe out I.2 even though, technically, the
     *  inserted stuff would be before the replace range. But, if you
     *  add tokens in front of a method body '{' and then delete the method
     *  body, I think the stuff before the '{' you added should disappear too.
     *
     *  Return a map from token index to operation.
     */
    protected RewriteOperation[size_t] reduceToSingleOperationPerIndex(RewriteOperation[] rewrites)
    {
        debug(TokenStreamRewriter) {
            import std.stdio : writefln;
            writefln("reduceToSingleOperationPerIndex");
            foreach (i, rew; rewrites)
                writefln("\trewrites[%s] = %s", i, rew);
        }

        // WALK REPLACES
        for (size_t i = 0; i < rewrites.length; i++) {
            RewriteOperation op = rewrites[i];
            debug(TokenStreamRewriter) {
                import std.stdio : writefln;
                writefln("op0 = %s", op);
            }
            if (op is null) continue;
            if (!(cast(ReplaceOp)op)) {
                continue;
            }
            debug(TokenStreamRewriter) {
                import std.stdio : writefln;
                writefln("op = %s", op);
            }
            ReplaceOp rop = cast(ReplaceOp)rewrites[i];
            // Wipe prior inserts within range
            InsertBeforeOp[] inserts = getKindOfOps!InsertBeforeOp(rewrites, i);
            foreach (InsertBeforeOp iop; inserts) {
                if ( iop.index == rop.index ) {
                    // E.g., insert before 2, delete 2..2; update replace
                    // text to include insert before, kill insert
                    rewrites[iop.instructionIndex] = null;
                    rop.text = iop.text ~ (rop.text !is null?rop.text:"");
                }
                else if (iop.index > rop.index && iop.index <= rop.lastIndex ) {
                    // delete insert as it's a no-op.
                    rewrites[iop.instructionIndex] =  null;
                }
            }
            // Drop any prior replaces contained within
            ReplaceOp[] prevReplaces = getKindOfOps!ReplaceOp(rewrites, i);
            foreach (ReplaceOp prevRop; prevReplaces) {
                if (prevRop.index>=rop.index && prevRop.lastIndex <= rop.lastIndex ) {
                    // delete replace as it's a no-op.
                    rewrites[prevRop.instructionIndex] = null;
                    continue;
                }
                // throw exception unless disjoint or identical
                bool disjoint =
                    prevRop.lastIndex<rop.index || prevRop.index > rop.lastIndex;
                // Delete special case of replace (text==null):
                // D.i-j.u D.x-y.v	| boundaries overlap	combine to max(min)..max(right)
                if ( prevRop.text==null && rop.text==null && !disjoint ) {
                    //System.out.println("overlapping deletes: "+prevRop+", "+rop);
                    rewrites[prevRop.instructionIndex] = null; // kill first delete
                    rop.index = min(prevRop.index, rop.index);
                    rop.lastIndex = max(prevRop.lastIndex, rop.lastIndex);
                    debug {
                        import std.stdio : stderr, writefln;
                        stderr.writefln("new rop %s", rop);
                    }
                }
                else if ( !disjoint ) {
                    throw
                        new
                        IllegalArgumentException(format(
                                                        "replace op boundaries of %s overlap with previous %s",
                                                        rop,
                                                        prevRop));
                }
            }
        }

        // WALK INSERTS
        debug(TokenStreamRewriter) {
            import std.stdio : stderr, writefln;
            writefln("WALK INSERTS");
        }
        for (int i = 0; i < rewrites.length; i++) {
            RewriteOperation op = rewrites[i];
            debug(TokenStreamRewriter) {
                import std.stdio : stderr, writefln;
                writefln("op = %s", op);
            }
            if (op is null) continue;
            if (!(cast(InsertBeforeOp)op)) continue;
            InsertBeforeOp iop = cast(InsertBeforeOp)rewrites[i];
            debug(TokenStreamRewriter) {
                import std.stdio : stderr, writefln;
                writefln("iop = %s, i = %s", iop, i);
            }
            // combine current insert with prior if any at same index
            InsertBeforeOp[] prevInserts = getKindOfOps!InsertBeforeOp(rewrites, i);
            foreach (InsertBeforeOp prevIop; prevInserts) {
                debug(TokenStreamRewriter) {
                    import std.stdio : stderr, writefln;
                    writefln("prevIop = %s", prevIop);
                }
                if (prevIop.index == iop.index) {
                    if (cast(InsertAfterOp)prevIop) {
                        iop.text = catOpText(prevIop.text, iop.text);
                        rewrites[prevIop.instructionIndex] = null;
                    }
                    else if (cast(InsertBeforeOp)prevIop) { // combine objects
                        // convert to strings...we're in process of toString'ing
                        // whole token buffer so no lazy eval issue with any templates
                        iop.text = catOpText(iop.text, prevIop.text);
                        // delete redundant prior insert
                        rewrites[prevIop.instructionIndex] = null;
                    }
                }
            }
            // look for replaces where iop.index is in range; error
            debug(TokenStreamRewriter) {
                import std.stdio : stderr, writefln;
                writefln("look for replaces where iop.index is in range, i = %s", i);
            }
            ReplaceOp[] prevReplaces = getKindOfOps!ReplaceOp(rewrites, i);
            debug(TokenStreamRewriter) {
                import std.stdio : stderr, writefln;
                writefln("prevReplaces = %s", prevReplaces);
            }
            foreach (ReplaceOp rop; prevReplaces) {
                if ( iop.index == rop.index ) {
                    rop.text = catOpText(iop.text, rop.text);
                    rewrites[i] = null;	// delete current insert
                    continue;
                }
                if ( iop.index >= rop.index && iop.index <= rop.lastIndex ) {
                    throw
                        new
                        IllegalArgumentException(
                                                 format("insert op %s within boundaries of previous %s",
                                                        iop, rop));
                }
            }
        }

        debug(TokenStreamRewriter) {
            import std.stdio : stderr, writefln;
            writefln("rewrites after = %s", rewrites);
        }
        RewriteOperation[size_t] m;
        for (int i = 0; i < rewrites.length; i++) {
            RewriteOperation op = rewrites[i];
            if (op is null) continue; // ignore deleted ops
            if (op.index in m) {
                throw new Error("should only be one op per index");
            }
            m[op.index] = op;
        }
        //System.out.println("index to op: "+m);
        debug(TokenStreamRewriter) {
            import std.stdio : stderr, writefln;
            writefln("index to op: = %s", m);
        }
        return m;
    }

    protected string catOpText(string a, string b)
    {
        string x;
        string y;
        if (a !is null) x = a;
        if (b !is null) y = b;
        return x~y;
    }

    protected auto getKindOfOps(T)(RewriteOperation[] rewrites, size_t before)
    {
        T[] ops;
        for (int i=0; i<before && i<rewrites.length; i++) {
            RewriteOperation op = rewrites[i];
            if (op is null) continue; // ignore deleted
            if (T.classinfo == op.classinfo) {
                ops ~= cast(T)(op);
            }
        }
        return ops;
    }

    public static TokenStream tokens()
    {
        return tokens_;
    }

}
