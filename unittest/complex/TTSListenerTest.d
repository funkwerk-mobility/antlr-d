module TTSListenerTest;

import std.stdio;
import std.conv;

version(unittest) {

    import RuleTranslatorLexer;
    import RuleTranslatorParser;
    import TTSListener;
    import antlr.v4.runtime.ANTLRInputStream;
    import antlr.v4.runtime.CommonToken;
    import antlr.v4.runtime.CommonTokenStream;
    import antlr.v4.runtime.LexerNoViableAltException;
    import antlr.v4.runtime.tree.ParseTreeWalker;
    import dshould : be, equal, not, should;
    import dshould.thrown;
    import std.conv : to;
    import std.file;
    import unit_threaded;

    class Test {

        @Tags("Lexer")
        @("complex_grammar")
        unittest {
            auto antlrInput = new ANTLRInputStream(File("unittest/complex/simple.rule", "r"));
            auto lexer = new RuleTranslatorLexer(antlrInput);
            auto cts = new CommonTokenStream(lexer);
            cts.getNumberOfOnChannelTokens.should.equal(35);
            auto f = File("unittest/complex/simple_tokens.cmp");
            auto charRange = f.byLine();
            string s;
            int i;
            foreach (t; charRange) {
                s = cts.get(i++).to!string;
                t.should.equal(s);
            }
            auto parser = new RuleTranslatorParser(cts);
            // Specify entry point
            auto rootContext = parser.file_input;
        }
    }
}