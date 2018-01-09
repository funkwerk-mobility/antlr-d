import std.stdio;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.LexerNoViableAltException;
import ExprLexer;
import ExprParser;
import ExprBaseListener;
import fluent.asserts;
import unit_threaded;


class Test {
    import antlr.v4.runtime.RuleContext;
    import antlr.v4.runtime.tree.RuleNode;

    @Tags("simpleExpr", "reg")
    @("simpleExprSimpleInput2Lines")
    unittest {
        auto s = "";
        class ExprListener : ExprBaseListener {
            override public void enterProg(ExprParser.ExprParser.ProgContext ctx) {
                import std.format;
                s ~= format("ich bin da %s", ctx.getText);
            }
            override public void exitProg(ExprParser.ExprParser.ProgContext ctx) {
                import std.format;
                s ~= format(" ich bin nicht mehr da!");
            }
        }
        
        auto input = "100\n122\n";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new ExprLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Expr.g4");
        lexer.getRuleNames.should.equal(["T__0", "T__1",
                                         "T__2", "T__3",
                                         "T__4", "T__5",
                                         "NEWLINE", "INT"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(5);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:2='100',<8>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,3:3='\\n',<7>,1:3]");
        Assert.equal((cast(CommonToken)cts.LT(3)).toString,
                     "[@2,4:6='122',<8>,2:0]");
        Assert.equal((cast(CommonToken)cts.LT(4)).toString,
                     "[@3,7:7='\\n',<7>,2:3]");
        // Pass the tokens to the parser
        ExprParser parser = new ExprParser(cts);
        // Specify our entry point
        ExprParser.ExprParser.ProgContext progContext = parser.prog;
        Assert.equal(progContext.children.length, 4);
        Assert.equal((cast(CommonToken)progContext.start).toString, "[@0,0:2='100',<8>,1:0]");
        Assert.equal((cast(CommonToken)progContext.stop).toString, "[@3,7:7='\\n',<7>,2:3]");
        Assert.equal(progContext.children[0].classinfo == RuleNode.classinfo, true);
        import antlr.v4.runtime.tree.TerminalNode;
        Assert.equal(progContext.children[1].classinfo == TerminalNode.classinfo, true);
        Assert.equal(progContext.children[2].classinfo == RuleNode.classinfo, true);
        Assert.equal(progContext.children[3].classinfo == TerminalNode.classinfo, true);
        Assert.equal((cast(RuleContext)progContext.getChild(0)).getText, "100");
        import antlr.v4.runtime.tree.ParseTreeWalker;
        auto baseLis = new ExprListener;
        auto walker = new ParseTreeWalker;
        walker.walk(baseLis, progContext);
        s.should.equal("ich bin da 100\n122\n ich bin nicht mehr da!");
    }

    @Tags("simpleExpr1", "reg")
    @("simpleExprSimpleInputWithBrackets")
    unittest {
        auto input = "(100)\n";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new ExprLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Expr.g4");
        lexer.getRuleNames.should.equal(["T__0", "T__1",
                                         "T__2", "T__3",
                                         "T__4", "T__5",
                                         "NEWLINE", "INT"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(5);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:0='(',<5>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,1:3='100',<8>,1:1]");
        Assert.equal((cast(CommonToken)cts.LT(3)).toString,
                     "[@2,4:4=')',<6>,1:4]");
        // Pass the tokens to the parser
        ExprParser parser = new ExprParser(cts);
        // Specify our entry point
        ExprParser.ExprParser.ProgContext progContext = parser.prog;
        Assert.equal(progContext.children.length, 2);
        Assert.equal((cast(CommonToken)progContext.start).toString, "[@0,0:0='(',<5>,1:0]");
        Assert.equal((cast(CommonToken)progContext.stop).toString, "[@3,5:5='\\n',<7>,1:5]");

        import antlr.v4.runtime.RuleContext;
        import antlr.v4.runtime.tree.RuleNode;
        Assert.equal(progContext.children[0].classinfo == RuleNode.classinfo, true);
        import antlr.v4.runtime.tree.TerminalNode;
        Assert.equal(progContext.children[1].classinfo == TerminalNode.classinfo, true);
        Assert.equal((cast(RuleContext)progContext).toStringTree(parser),
                     "([] ([4] [@0,0:0='(',<5>,1:0] ([15 4] [@1,1:3='100',<8>,1:1]) " ~
                     "[@2,4:4=')',<6>,1:4]) [@3,5:5='\\n',<7>,1:5])[\"prog\", \"expr\"]");
    }

    @Tags("simpleExpr2", "reg")
    @("simpleExprWith+")
    unittest {
        auto input = "100*13\n";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new ExprLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Expr.g4");
        lexer.getRuleNames.should.equal(["T__0", "T__1", "T__2", "T__3",
                                         "T__4", "T__5", "NEWLINE", "INT"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(5);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:2='100',<8>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,3:3='*',<1>,1:3]");
        Assert.equal((cast(CommonToken)cts.LT(3)).toString,
                     "[@2,4:5='13',<8>,1:4]");
        // Pass the tokens to the parser
        ExprParser parser = new ExprParser(cts);
        // Specify our entry point
        ExprParser.ExprParser.ProgContext progContext = parser.prog;
        Assert.equal(progContext.children.length, 2);
        Assert.equal((cast(RuleContext)progContext).toStringTree(parser),
                     "([] ([4] ([2 4] [@0,0:2='100',<8>,1:0]) " ~
                     "[@1,3:3='*',<1>,1:3] ([22 4] [@2,4:5='13',<8>,1:4])) " ~
                     "[@3,6:6='\\n',<7>,1:6])[\"prog\", \"expr\"]");
    }

    @Tags("simpleExpr3", "reg")
    @("simpleExpr3")
    unittest {
        auto input = "(100+2)*3\n";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new ExprLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Expr.g4");
        lexer.getRuleNames.should.equal(["T__0", "T__1",
                                         "T__2", "T__3",
                                         "T__4", "T__5",
                                         "NEWLINE", "INT"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(9);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:0='(',<5>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,1:3='100',<8>,1:1]");
        Assert.equal((cast(CommonToken)cts.LT(3)).toString,
                     "[@2,4:4='+',<3>,1:4]");
        // Pass the tokens to the parser
        ExprParser parser = new ExprParser(cts);
        // Specify our entry point
        ExprParser.ExprParser.ProgContext progContext = parser.prog;
        Assert.equal((cast(RuleContext)progContext).toStringTree(parser),
                     "([] ([4] ([2 4] [@0,0:0='(',<5>,1:0] ([15 2 4] "~
                     "([2 15 2 4] [@1,1:3='100',<8>,1:1]) [@2,4:4='+',<3>,1:4] "~
                     "([25 15 2 4] [@3,5:5='2',<8>,1:5])) [@4,6:6=')',<6>,1:6]) "~
                     "[@5,7:7='*',<1>,1:7] ([22 4] [@6,8:8='3',<8>,1:8])) "~
                     "[@7,9:9='\\n',<7>,1:9])[\"prog\", \"expr\"]");
    }
}