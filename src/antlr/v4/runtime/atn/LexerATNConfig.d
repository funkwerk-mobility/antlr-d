/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.atn.LexerATNConfig;

import antlr.v4.runtime.atn.ATNConfig;
import antlr.v4.runtime.atn.LexerActionExecutor;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.SemanticContext;

// Class LexerATNConfig
/**
 * TODO add class description
 */
class LexerATNConfig : ATNConfig
{

    /**
     * @uml
     * This is the backing field for {@link #getLexerActionExecutor}.
     */
    public LexerActionExecutor lexerActionExecutor;

    public bool passedThroughNonGreedyDecision;

    public this(ATNState state, int alt, PredictionContext context)
    {
        super(state, alt, context, SemanticContext.NONE);
        this.passedThroughNonGreedyDecision = false;
        this.lexerActionExecutor = null;
    }

    public this(ATNState state, int alt, PredictionContext context, LexerActionExecutor lexerActionExecutor)
    {
        super(state, alt, context, SemanticContext.NONE);
        this.lexerActionExecutor = lexerActionExecutor;
        this.passedThroughNonGreedyDecision = false;
    }

    public this(LexerATNConfig c, ATNState state)
    {
        super(c, state, c.context, c.semanticContext);
        this.lexerActionExecutor = c.lexerActionExecutor;
        this.passedThroughNonGreedyDecision = checkNonGreedyDecision(c, state);
    }

    public this(LexerATNConfig c, ATNState state, LexerActionExecutor lexerActionExecutor)
    {
        super(c, state, c.context, c.semanticContext);
        this.lexerActionExecutor = lexerActionExecutor;
        this.passedThroughNonGreedyDecision = checkNonGreedyDecision(c, state);
    }

    public this(LexerATNConfig c, ATNState state, PredictionContext context)
    {
        super(c, state, context, c.semanticContext);
        this.lexerActionExecutor = c.lexerActionExecutor;
        this.passedThroughNonGreedyDecision = checkNonGreedyDecision(c, state);
    }

    /**
     * @uml
     * Gets the {@link LexerActionExecutor} capable of executing the embedded
     *  action(s) for the current configuration.
     */
    public LexerActionExecutor getLexerActionExecutor()
    {
    }

    public bool hasPassedThroughNonGreedyDecision()
    {
    }

    /**
     * @uml
     * @override
     */
    public override int hashCode()
    {
    }

    public bool equals(ATNConfig other)
    {
    }

    public static bool checkNonGreedyDecision(LexerATNConfig source, ATNState target)
    {
    }

}