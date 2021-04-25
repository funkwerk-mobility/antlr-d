/*
 * Copyright (c) 2012-2020 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */
package org.antlr.v4.test.runtime.d;

import org.antlr.v4.Tool;
import org.antlr.v4.automata.ATNFactory;
import org.antlr.v4.automata.ATNPrinter;
import org.antlr.v4.automata.LexerATNFactory;
import org.antlr.v4.automata.ParserATNFactory;
import org.antlr.v4.codegen.CodeGenerator;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.IntStream;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenSource;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.WritableToken;
import org.antlr.v4.runtime.atn.ATN;
import org.antlr.v4.runtime.atn.ATNDeserializer;
import org.antlr.v4.runtime.atn.ATNSerializer;
import org.antlr.v4.runtime.atn.ATNState;
import org.antlr.v4.runtime.atn.DecisionState;
import org.antlr.v4.runtime.atn.LexerATNSimulator;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.IntegerList;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.semantics.SemanticPipeline;
import org.antlr.v4.test.runtime.*;
import org.antlr.v4.tool.ANTLRMessage;
import org.antlr.v4.tool.DOTGenerator;
import org.antlr.v4.tool.Grammar;
import org.antlr.v4.tool.GrammarSemanticsMessage;
import org.antlr.v4.tool.LexerGrammar;
import org.antlr.v4.tool.Rule;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.STGroupString;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import static org.antlr.v4.test.runtime.BaseRuntimeTest.antlrOnString;
import static org.antlr.v4.test.runtime.BaseRuntimeTest.writeFile;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class BaseDTest extends BaseRuntimeTestSupport implements RuntimeTestSupport {

    /**
     * If error during parser execution, store stderr here; can't return
     * stdout and stderr.  This doesn't trap errors from running antlr.
     */
    protected String stderrDuringParse;

	@Override
	protected String getPropertyPrefix() {
		return "antrl4-d";
	}

    @Override
    public void testTearDown() throws Exception {
    }

    @Override
    public String getParseErrors() {
        return stderrDuringParse;
    }

    protected org.antlr.v4.Tool newTool(String[] args) {
        Tool tool = new Tool(args);
        return tool;
    }

    protected Tool newTool() {
        org.antlr.v4.Tool tool = new Tool(new String[] {"-o", getTempDirPath()});
        return tool;
    }

    protected ATN createATN(Grammar g, boolean useSerializer) {
        if (g.atn == null) {
            semanticProcess(g);
            assertEquals(0, g.tool.getNumErrors());

            ParserATNFactory f;
            if (g.isLexer()) {
                f = new LexerATNFactory((LexerGrammar)g);
            }
            else {
                f = new ParserATNFactory(g);
            }

            g.atn = f.createATN();
            assertEquals(0, g.tool.getNumErrors());
        }

        ATN atn = g.atn;
        if (useSerializer) {
            char[] serialized = ATNSerializer.getSerializedAsChars(atn);
            return new ATNDeserializer().deserialize(serialized);
        }

        return atn;
    }

    protected void semanticProcess(Grammar g) {
        if (g.ast != null && !g.ast.hasErrors) {
            System.out.println(g.ast.toStringTree());
            Tool antlr = new Tool();
            SemanticPipeline sem = new SemanticPipeline(g);
            sem.process();
            if (g.getImportedGrammars() != null) { // process imported grammars (if any)
                for (Grammar imp : g.getImportedGrammars()) {
                    antlr.processNonCombinedGrammar(imp, false);
                }
            }
        }
    }

    public DFA createDFA(Grammar g, DecisionState s) {
//      PredictionDFAFactory conv = new PredictionDFAFactory(g, s);
//      DFA dfa = conv.createDFA();
//      conv.issueAmbiguityWarnings();
//      System.out.print("DFA="+dfa);
//      return dfa;
        return null;
    }

//  public void minimizeDFA(DFA dfa) {
//      DFAMinimizer dmin = new DFAMinimizer(dfa);
//      dfa.minimized = dmin.minimize();
//  }

    IntegerList getTypesFromString(Grammar g, String expecting) {
        IntegerList expectingTokenTypes = new IntegerList();
        if (expecting != null && !expecting.trim().isEmpty()) {
            for (String tname : expecting.replace(" ", "").split(",")) {
                int ttype = g.getTokenType(tname);
                expectingTokenTypes.add(ttype);
            }
        }
        return expectingTokenTypes;
    }

    public IntegerList getTokenTypesViaATN(String input, LexerATNSimulator lexerATN) {
        ANTLRInputStream in = new ANTLRInputStream(input);
        IntegerList tokenTypes = new IntegerList();
        int ttype;
        do {
            ttype = lexerATN.match(in, Lexer.DEFAULT_MODE);
            tokenTypes.add(ttype);
        } while (ttype != Token.EOF);
        return tokenTypes;
    }

    public List<String> getTokenTypes(LexerGrammar lg,
                                      ATN atn,
                                      CharStream input)
    {
        LexerATNSimulator interp = new LexerATNSimulator(atn,new DFA[] { new DFA(atn.modeToStartState.get(Lexer.DEFAULT_MODE)) },null);
        List<String> tokenTypes = new ArrayList<String>();
        int ttype;
        boolean hitEOF = false;
        do {
            if (hitEOF) {
                tokenTypes.add("EOF");
                break;
            }
            int t = input.LA(1);
            ttype = interp.match(input, Lexer.DEFAULT_MODE);
            if (ttype == Token.EOF) {
                tokenTypes.add("EOF");
            }
            else {
                tokenTypes.add(lg.typeToTokenList.get(ttype));
            }

            if (t == IntStream.EOF) {
                hitEOF = true;
            }
        } while (ttype != Token.EOF);
        return tokenTypes;
    }

    List<ANTLRMessage> checkRuleDFA(String gtext, String ruleName, String expecting)
        throws Exception
    {
        ErrorQueue equeue = new ErrorQueue();
        Grammar g = new Grammar(gtext, equeue);
        ATN atn = createATN(g, false);
        ATNState s = atn.ruleToStartState[g.getRule(ruleName).index];
        if (s == null) {
            System.err.println("no such rule: "+ruleName);
            return null;
        }
        ATNState t = s.transition(0).target;
        if (!(t instanceof DecisionState)) {
            System.out.println(ruleName+" has no decision");
            return null;
        }
        DecisionState blk = (DecisionState)t;
        checkRuleDFA(g, blk, expecting);
        return equeue.all;
    }

    List<ANTLRMessage> checkRuleDFA(String gtext, int decision, String expecting)
        throws Exception
    {
        ErrorQueue equeue = new ErrorQueue();
        Grammar g = new Grammar(gtext, equeue);
        ATN atn = createATN(g, false);
        DecisionState blk = atn.decisionToState.get(decision);
        checkRuleDFA(g, blk, expecting);
        return equeue.all;
    }

    void checkRuleDFA(Grammar g, DecisionState blk, String expecting)
        throws Exception
    {
        DFA dfa = createDFA(g, blk);
        String result = null;
        if (dfa != null) result = dfa.toString();
        assertEquals(expecting, result);
    }

    List<ANTLRMessage> checkLexerDFA(String gtext, String expecting)
        throws Exception
    {
        return checkLexerDFA(gtext, LexerGrammar.DEFAULT_MODE_NAME, expecting);
    }

    List<ANTLRMessage> checkLexerDFA(String gtext, String modeName, String expecting)
        throws Exception
    {
        ErrorQueue equeue = new ErrorQueue();
        LexerGrammar g = new LexerGrammar(gtext, equeue);
        g.atn = createATN(g, false);
//      LexerATNToDFAConverter conv = new LexerATNToDFAConverter(g);
//      DFA dfa = conv.createDFA(modeName);
//      g.setLookaheadDFA(0, dfa); // only one decision to worry about
//
//      String result = null;
//      if ( dfa!=null ) result = dfa.toString();
//      assertEquals(expecting, result);
//
//      return equeue.all;
        return null;
    }

    protected String getLanguage() {
        return "D";
    }

    protected String execLexer(String grammarFileName,
                               String grammarStr,
                               String lexerName,
                               String input)
    {
        return execLexer(grammarFileName, grammarStr, lexerName, input, false);
    }

    @Override
    public  String execLexer(String grammarFileName,
                             String grammarStr,
                             String lexerName,
                             String input,
                             boolean showDFA)
    {
        boolean success = rawGenerateAndBuildRecognizer(grammarFileName,
                                                        grammarStr,
                                                        null,
                                                        lexerName,"-no-listener");
        assertTrue(success);
        writeFile(getTempDirPath(), "input", input);
        writeLexerTestFile(lexerName, showDFA);
        String output = execModule("Test.d");
        return output;
    }

    public ParseTree execStartRule(String startRuleName, Parser parser)
        throws IllegalAccessException, InvocationTargetException,
        NoSuchMethodException
    {
        Method startRule = null;
        Object[] args = null;
        try {
            startRule = parser.getClass().getMethod(startRuleName);
        }
        catch (NoSuchMethodException nsme) {
            // try with int _p arg for recursive func
            startRule = parser.getClass().getMethod(startRuleName, int.class);
            args = new Integer[] {0};
        }
        ParseTree result = (ParseTree)startRule.invoke(parser, args);
//      System.out.println("parse tree = "+result.toStringTree(parser));
        return result;
    }

    @Override
    public String execParser(String grammarFileName,
                             String grammarStr,
                             String parserName,
                             String lexerName,
                             String listenerName,
                             String visitorName,
                             String startRuleName,
                             String input,
                             boolean showDiagnosticErrors)
    {
        boolean success = rawGenerateAndBuildRecognizer(grammarFileName,
                                                        grammarStr,
                                                        parserName,
                                                        lexerName,
                                                        "-visitor");
        assertTrue(success);
        writeFile(getTempDirPath(), "input", input);
        rawBuildRecognizerTestFile(parserName,
                                   lexerName,
                                   listenerName,
                                   visitorName,
                                   startRuleName,
                                   showDiagnosticErrors,
                                   false);
        return execRecognizer();
    }

    /** Return true if all is well */
    protected boolean rawGenerateAndBuildRecognizer(String grammarFileName,
                                                    String grammarStr,
                                                    String parserName,
                                                    String lexerName,
                                                    String... extraOptions)
    {
        return rawGenerateAndBuildRecognizer(grammarFileName, grammarStr, parserName, lexerName, false, extraOptions);
    }

    /** Return true if all is well */
    protected boolean rawGenerateAndBuildRecognizer(String grammarFileName,
                                                    String grammarStr,
                                                    String parserName,
                                                    String lexerName,
                                                    boolean defaultListener,
                                                    String... extraOptions)
    {
        ErrorQueue equeue =
            antlrOnString(getTempDirPath(), "D", grammarFileName, grammarStr, defaultListener, extraOptions);
        if (!equeue.errors.isEmpty()) {
            return false;
        }

        List<String> files = new ArrayList<String>();
        if (lexerName != null) {
            files.add(lexerName+".d");
        }
        if (parserName != null) {
            files.add(parserName+".d");
            Set<String> optionsSet = new HashSet<String>(Arrays.asList(extraOptions));
            if (!optionsSet.contains("-no-listener")) {
                files.add(grammarFileName.substring(0, grammarFileName.lastIndexOf('.'))+"Listener.d");
            }
            if (optionsSet.contains("-visitor")) {
                files.add(grammarFileName.substring(0, grammarFileName.lastIndexOf('.'))+"Visitor.d");
            }
        }
        return true; // allIsWell: no compile
    }

    protected void rawBuildRecognizerTestFile(String parserName,
                                              String lexerName,
                                              String listenerName,
                                              String visitorName,
                                              String parserStartRuleName,
                                              boolean debug,
                                              boolean trace)
    {
        this.stderrDuringParse = null;
        if (parserName == null) {
            writeLexerTestFile(lexerName, false);
        }
        else {
            writeParserTestFile(parserName,
                                lexerName,
                                listenerName,
                                visitorName,
                                parserStartRuleName,
                                debug, trace);
        }
    }

    public String execRecognizer() {
        return execModule("Test.d");
    }


    private static String detectedOS;
    public static String getOS() {
        if (detectedOS == null) {
            String os = System.getProperty("os.name", "generic").toLowerCase(Locale.ENGLISH);
            if ((os.indexOf("mac") >= 0) || (os.indexOf("darwin") >= 0)) {
                detectedOS = "mac";
            }
            else if (os.indexOf("win") >= 0) {
                detectedOS = "windows";
            }
            else if (os.indexOf("nux") >= 0) {
                detectedOS = "linux";
            }
            else {
                detectedOS = "unknown";
            }
        }
        return detectedOS;
    }

    public List<String> allCppFiles(String path) {
        ArrayList<String> files = new ArrayList<String>();
        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();
        for (int i = 0; i < listOfFiles.length; i++) {
            String file = listOfFiles[i].getAbsolutePath();
            if (file.endsWith(".d")) {
                files.add(file);
            }
        }
        return files;
    }

    private String runProcess(ProcessBuilder builder, String description, boolean showStderr) throws Exception {
      System.out.println("BUILDER: "+builder.command());
        Process process = builder.start();
        StreamVacuum stdoutVacuum = new StreamVacuum(process.getInputStream());
        StreamVacuum stderrVacuum = new StreamVacuum(process.getErrorStream());
        stdoutVacuum.start();
        stderrVacuum.start();
        int errcode = process.waitFor();
        stdoutVacuum.join();
        stderrVacuum.join();
        String output = stdoutVacuum.toString();
        if (stderrVacuum.toString().length() > 0) {
            this.stderrDuringParse = stderrVacuum.toString();
            if (showStderr) System.err.println(this.stderrDuringParse);
        }
        if (errcode != 0) {
            String err = "execution of '"+description+"' failed with error code: "+errcode;
            if (this.stderrDuringParse != null) {
                this.stderrDuringParse += err;
            }
            else {
                this.stderrDuringParse = err;
            }
        }

        return output;
    }

    private String runCommand(String command[], String workPath, String description, boolean showStderr) throws Exception {
        System.out.println("\nrunCommand command -> " + Arrays.toString(command) + "\nworkPath -> " + workPath);
        ProcessBuilder builder = new ProcessBuilder(command);
        builder.directory(new File(workPath));

        return runProcess(builder, description, showStderr);
    }

    private boolean buildRuntime() {
        String runtimePath = locateRuntime();
        System.out.println("Building ANTLR4 D runtime (if necessary) at "+ runtimePath);

        try {
            String command[] = { "dub", "--build=release", "--compiler=ldc2" };
            if (runCommand(command, runtimePath, "can't compile antlr d runtime", false) == null) {
                return false;
            }
        }
        catch (Exception e) {
            System.err.println("can't compile antlr d runtime");
            e.printStackTrace(System.err);
            try {
                String command[] = { "ls", "-la" };
                String output = runCommand(command, runtimePath + "/lib/", "printing library folder content", true);
                System.out.println(output);
            }
            catch (Exception e2) {
                System.err.println("can't even list folder content");
                e2.printStackTrace(System.err);
            }
        }


/* for debugging
        try {
            String command[] = { "ls", "-la" };
                String output = runCommand(command, runtimePath + "/dist/", "printing library folder content");
            System.out.println(output);
        }
        catch (Exception e) {
            System.err.println("can't print folder content");
        }
*/

        return true;
    }

    static Boolean runtimeBuiltOnce = false;

    public String execModule(String fileName) {
        String runtimePath = locateRuntime();
        String includePath = runtimePath + "/source";
        //System.out.println("runtimePath -> " + runtimePath + "\nincludePath -> "+ includePath);
        String binPath = new File(new File(getTempDirPath()), "test").getAbsolutePath();
        String inputPath = new File(new File(getTempDirPath()), "input").getAbsolutePath();

        // Build runtime using dub once.
        synchronized (runtimeBuiltOnce) {
            if (!runtimeBuiltOnce) {
                try {
                    String command[] = {"ldc2", "--version"};
                    String output = runCommand(command, getTempDirPath(), "printing compiler version", false);
                    System.out.println("Compiler version is: "+output);
                }
                catch (Exception e) {
                    System.err.println("Can't get compiler version");
                }

                runtimeBuiltOnce = true;
                if (!buildRuntime()) {
                    System.out.println("D runtime build failed\n");
                    return null;
                }
                System.out.println("D runtime build succeeded\n");
            }
        }

        String libExtension = ("mac".equals(getOS())) ? "dylib" : "so";

        // Create sym link to the runtime. Currently only used on OSX.
        if ("mac".equals(getOS())) {
            try {
                String command[] = { "ln", "-s", runtimePath + "/lib/libantlr-d." + libExtension };
                if (runCommand(command, getTempDirPath(), "sym linking D runtime", true) == null)
                    return null;
            }
            catch (Exception e) {
                System.err.println("can't create link to " + runtimePath + "/lib/libantlr-d." + libExtension);
                e.printStackTrace(System.err);
                return null;
            }
        }

        try {
            List<String> command2 = new ArrayList<String>(Arrays.asList("ldc2", "-link-defaultlib-shared",
                "-I", includePath, "-L-L" + runtimePath + "/lib", "-L-lantlr-d", "-of", "test"));
            command2.addAll(allCppFiles(getTempDirPath()));
            if (runCommand(command2.toArray(new String[0]), getTempDirPath(), "building test binary", true) == null) {
                return null;
            }
        }
        catch (Exception e) {
            System.err.println("can't compile test module: " + e.getMessage());
            e.printStackTrace(System.err);
            return null;
        }

        // Now run the newly minted binary. Reset the error output, as we could have got compiler warnings which are not relevant here.
        this.stderrDuringParse = null;
        try {
            ProcessBuilder builder = new ProcessBuilder(binPath, inputPath, "-v");
            builder.directory(new File(getTempDirPath()));
            Map<String, String> env = builder.environment();
            // env.put("LD_PRELOAD", runtimePath + "/lib/libantlr-d." + libExtension);
            env.put("LD_LIBRARY_PATH", runtimePath + "/lib");
            String output = runProcess(builder, "running test binary", false);

            if (output.length()==0) {
                output = null;
            }

            System.out.println("=========================================================");
            System.out.println(output);
            System.out.println("=========================================================");

            return output;
        }
        catch (Exception e) {
            System.err.println("can't exec module: " + fileName);
            e.printStackTrace(System.err);
        }

        return null;
    }

    protected String locateRuntime() {
        final ClassLoader loader = Thread.currentThread().getContextClassLoader();
        final URL runtimeURL = loader.getResource("D");
        if (runtimeURL == null) {
            throw new RuntimeException("Cannot find runtime");
        }
        // Windows not getting runtime right. See:
        // http://stackoverflow.com/questions/6164448/convert-url-to-normal-windows-filename-java
        // it was coming back "/C:/projects/antlr4-l7imv/runtime-testsuite/target/classes/Cpp"
        String p;
        try {
            p = Paths.get(runtimeURL.toURI()).toFile().toString();
        }
        catch (URISyntaxException use) {
            p = "Can't find runtime";
        }
        return p;
    }

    List<ANTLRMessage> getMessagesOfType(List<ANTLRMessage> msgs, Class<? extends ANTLRMessage> c) {
        List<ANTLRMessage> filtered = new ArrayList<ANTLRMessage>();
        for (ANTLRMessage m : msgs) {
            if (m.getClass() == c) filtered.add(m);
        }
        return filtered;
    }

    void checkRuleATN(Grammar g, String ruleName, String expecting) {
        ParserATNFactory f = new ParserATNFactory(g);
        ATN atn = f.createATN();

        DOTGenerator dot = new DOTGenerator(g);
        System.out.println(dot.getDOT(atn.ruleToStartState[g.getRule(ruleName).index]));

        Rule r = g.getRule(ruleName);
        ATNState startState = atn.ruleToStartState[r.index];
        ATNPrinter serializer = new ATNPrinter(g, startState);
        String result = serializer.asString();

        //System.out.print(result);
        assertEquals(expecting, result);
    }

    public void testActions(String templates, String actionName, String action, String expected) throws org.antlr.runtime.RecognitionException {
        int lp = templates.indexOf('(');
        String name = templates.substring(0, lp);
        STGroup group = new STGroupString(templates);
        ST st = group.getInstanceOf(name);
        st.add(actionName, action);
        String grammar = st.render();
        ErrorQueue equeue = new ErrorQueue();
        Grammar g = new Grammar(grammar, equeue);
        if (g.ast != null && !g.ast.hasErrors) {
            SemanticPipeline sem = new SemanticPipeline(g);
            sem.process();

            ATNFactory factory = new ParserATNFactory(g);
            if (g.isLexer()) factory = new LexerATNFactory((LexerGrammar)g);
            g.atn = factory.createATN();

            CodeGenerator gen = new CodeGenerator(g);
            ST outputFileST = gen.generateParser();
            String output = outputFileST.render();
            //System.out.println(output);
            String b = "#" + actionName + "#";
            int start = output.indexOf(b);
            String e = "#end-" + actionName + "#";
            int end = output.indexOf(e);
            String snippet = output.substring(start+b.length(),end);
            assertEquals(expected, snippet);
        }
        if (equeue.size() > 0) {
            System.err.println(equeue.toString());
        }
    }

    protected void checkGrammarSemanticsError(ErrorQueue equeue,
                                              GrammarSemanticsMessage expectedMessage)
        throws Exception
    {
        ANTLRMessage foundMsg = null;
        for (int i = 0; i < equeue.errors.size(); i++) {
            ANTLRMessage m = equeue.errors.get(i);
            if (m.getErrorType()==expectedMessage.getErrorType() ) {
                foundMsg = m;
            }
        }
        assertNotNull("no error; "+expectedMessage.getErrorType()+" expected", foundMsg);
        assertTrue("error is not a GrammarSemanticsMessage",
                   foundMsg instanceof GrammarSemanticsMessage);
        assertEquals(Arrays.toString(expectedMessage.getArgs()), Arrays.toString(foundMsg.getArgs()));
        if (equeue.size() != 1) {
            System.err.println(equeue);
        }
    }

    protected void checkGrammarSemanticsWarning(ErrorQueue equeue,
                                                GrammarSemanticsMessage expectedMessage)
        throws Exception
    {
        ANTLRMessage foundMsg = null;
        for (int i = 0; i < equeue.warnings.size(); i++) {
            ANTLRMessage m = equeue.warnings.get(i);
            if (m.getErrorType()==expectedMessage.getErrorType() ) {
                foundMsg = m;
            }
        }
        assertNotNull("no error; "+expectedMessage.getErrorType()+" expected", foundMsg);
        assertTrue("error is not a GrammarSemanticsMessage",
                   foundMsg instanceof GrammarSemanticsMessage);
        assertEquals(Arrays.toString(expectedMessage.getArgs()), Arrays.toString(foundMsg.getArgs()));
        if (equeue.size() != 1) {
            System.err.println(equeue);
        }
    }

    protected void checkError(ErrorQueue equeue,
                              ANTLRMessage expectedMessage)
        throws Exception
    {
        //System.out.println("errors="+equeue);
        ANTLRMessage foundMsg = null;
        for (int i = 0; i < equeue.errors.size(); i++) {
            ANTLRMessage m = equeue.errors.get(i);
            if (m.getErrorType()==expectedMessage.getErrorType() ) {
                foundMsg = m;
            }
        }
        assertTrue("no error; "+expectedMessage.getErrorType()+" expected", !equeue.errors.isEmpty());
        assertTrue("too many errors; "+equeue.errors, equeue.errors.size()<=1);
        assertNotNull("couldn't find expected error: "+expectedMessage.getErrorType(), foundMsg);
        /*
        assertTrue("error is not a GrammarSemanticsMessage",
                   foundMsg instanceof GrammarSemanticsMessage);
         */
        assertArrayEquals(expectedMessage.getArgs(), foundMsg.getArgs());
    }

    public static class FilteringTokenStream extends CommonTokenStream {
        public FilteringTokenStream(TokenSource src) { super(src); }
        Set<Integer> hide = new HashSet<Integer>();
        @Override
        protected boolean sync(int i) {
            if (!super.sync(i)) {
                return false;
            }

            Token t = get(i);
            if (hide.contains(t.getType())) {
                ((WritableToken)t).setChannel(Token.HIDDEN_CHANNEL);
            }

            return true;
        }
        public void setTokenTypeChannel(int ttype, int channel) {
            hide.add(ttype);
        }
    }

    protected void mkdir(String dir) {
        File f = new File(dir);
        f.mkdirs();
    }

    protected void writeParserTestFile(String parserName, String lexerName,
                                       String listenerName, String visitorName,
                                       String parserStartRuleName, boolean debug, boolean trace) {
        if(!parserStartRuleName.endsWith(")"))
            parserStartRuleName += "()";
        ST outputFileST = new ST(
                "import std.stdio : File, write, writefln;\n"
                + "import std.exception : enforce;\n"
                + "\n"
                + "import antlr.v4.runtime.Token;\n"
                + "import antlr.v4.runtime.ANTLRInputStream;\n"
                + "import antlr.v4.runtime.CommonTokenStream;\n"
                + "import antlr.v4.runtime.DiagnosticErrorListener;\n"
                + "import antlr.v4.runtime.Lexer;\n"
                + "import antlr.v4.runtime.ParserRuleContext;\n"
                + "import antlr.v4.runtime.atn.ParserATNSimulator;\n"
                + "import antlr.v4.runtime.tree.ParseTree;\n"
                + "import antlr.v4.runtime.tree.ParseTreeListener;\n"
                + "import antlr.v4.runtime.tree.TerminalNode;\n"
                + "import antlr.v4.runtime.tree.ErrorNode;\n"
                + "import antlr.v4.runtime.tree.ParseTreeWalker;\n"
                + "import <lexerName> : <lexerName>;\n"
                + "import <parserName> : <parserName>;\n"
                + "\n"
                + "class TreeShapeListener : ParseTreeListener {\n"
                + "public override\n"
                + "  void visitTerminal(TerminalNode) {}\n"
                + "public override\n"
                + "  void visitErrorNode(ErrorNode) {}\n"
                + "public override\n"
                + "  void exitEveryRule(ParserRuleContext) {}\n"
                + "public override\n"
                + "  void enterEveryRule(ParserRuleContext ctx) {\n"
                + "    foreach (child; ctx.children) {\n"
                + "      ParseTree parent = child.getParent;\n"
                + "      ParserRuleContext rule = cast(ParserRuleContext)parent;\n"
                + "      enforce(rule == ctx, \"Invalid parse tree shape detected.\");\n"
                + "    }\n"
                + "  }\n"
                + "}\n"
                + "\n"
                + "\n"
                + "int main(string[] args) {\n"
                + "  auto antlrInput =\n"
                + "      new ANTLRInputStream(File(args[1]));\n"
                + "  auto lexer = new <lexerName>(antlrInput);\n"
                + "  auto tokens = new CommonTokenStream(lexer);\n"
                + "<createParser>"
                + "\n"
                + "  ParseTree tree = parser.<parserStartRuleName>;\n"
                + "  TreeShapeListener listener = new TreeShapeListener;\n"
                + "  auto tw = new ParseTreeWalker;\n"
                + "  tw.walk(listener, tree);\n"
                + "\n"
                + "  return 0;\n"
                + "}\n"
        );

        String stSource = "  auto parser = new <parserName>(tokens);\n";
        if(debug) {
            stSource += "  auto errorListener = new DiagnosticErrorListener();\n";
            stSource += "  parser.addErrorListener(errorListener);\n";
        }
        if(trace)
            stSource += "  parser.setTrace(true);\n";
        ST createParserST = new ST(stSource);
        outputFileST.add("createParser", createParserST);
        outputFileST.add("parserName", parserName);
        outputFileST.add("lexerName", lexerName);
        outputFileST.add("listenerName", listenerName);
        outputFileST.add("visitorName", visitorName);
        outputFileST.add("parserStartRuleName", parserStartRuleName);
        writeFile(getTempDirPath(), "Test.d", outputFileST.render());
    }

    protected void writeLexerTestFile(String lexerName, boolean showDFA) {
        ST outputFileST = new ST(
            "import std.stdio : File, write, writefln;\n"
                + "\n"
                + "import antlr.v4.runtime.Token;\n"
                + "import antlr.v4.runtime.ANTLRInputStream;\n"
                + "import antlr.v4.runtime.CommonTokenStream;\n"
                + "import antlr.v4.runtime.Lexer;\n"
                + "import antlr.v4.runtime.atn.LexerATNSimulator;\n"
                + "import <lexerName> : <lexerName>;\n"
                + "\n"
                + "int main(string[] args) {\n"
                + "  auto antlrInput =\n"
                + "      new ANTLRInputStream(File(args[1]));\n"
                + "  auto lexer = new <lexerName>(antlrInput);\n"
                + "  auto tokens = new CommonTokenStream(lexer);\n"
                + "  tokens.fill();\n"
                + "  foreach (token; tokens.getTokens)\n"
                + "    writefln!\"%s\"(token);\n"
                + (showDFA ? "  write((cast(LexerATNSimulator)lexer.getInterpreter).getDFA(Lexer.DEFAULT_MODE).toLexerString);\n" : "\n")
                + "  return 0;\n"
                + "}\n");
        outputFileST.add("lexerName", lexerName);
        writeFile(getTempDirPath(), "Test.d", outputFileST.render());
    }

    public void writeRecognizer(String parserName, String lexerName,
                                String listenerName, String visitorName,
                                String parserStartRuleName, boolean debug, boolean trace) {
        if (parserName == null) {
            writeLexerTestFile(lexerName, debug);
        }
        else {
            writeParserTestFile(parserName,
                                lexerName,
                                listenerName,
                                visitorName,
                                parserStartRuleName,
                                debug,
                                trace);
        }
    }


    protected void eraseFiles(final String filesEndingWith) {
        File tmpDirF = new File(getTempDirPath());
        String[] files = tmpDirF.list();
        for(int i = 0; files!=null && i < files.length; i++) {
            if (files[i].endsWith(filesEndingWith)) {
                new File(getTempDirPath()+"/"+files[i]).delete();
            }
        }
    }

    protected void eraseFiles(File dir) {
        String[] files = dir.list();
        for(int i = 0; files!=null && i < files.length; i++) {
            new File(dir,files[i]).delete();
        }
    }

    @Override
    public void eraseTempDir() {
        boolean doErase = true;
        String propName = getPropertyPrefix() + "-erase-test-dir";
        String prop = System.getProperty(propName);
        if(prop!=null && prop.length()>0)
            doErase = Boolean.getBoolean(prop);
        if(doErase) {
            File tmpDirF = new File(getTempDirPath());
            if (tmpDirF.exists()) {
                eraseFiles(tmpDirF);
                tmpDirF.delete();
            }
        }
    }

    public String getFirstLineOfException() {
        if (this.stderrDuringParse == null) {
            return null;
        }
        String[] lines = this.stderrDuringParse.split("\n");
        String prefix="Exception in thread \"main\" ";
        return lines[0].substring(prefix.length(),lines[0].length());
    }

    /**
     * When looking at a result set that consists of a Map/HashTable
     * we cannot rely on the output order, as the hashing algorithm or other aspects
     * of the implementation may be different on different JDKs or platforms. Hence
     * we take the Map, convert the keys to a List, sort them and Stringify the Map, which is a
     * bit of a hack, but guarantees that we get the same order on all systems. We assume that
     * the keys are strings.
     *
     * @param m The Map that contains keys we wish to return in sorted order
     * @return A string that represents all the keys in sorted order.
     */
    public <K, V> String sortMapToString(Map<K, V> m) {
        // Pass in crap, and get nothing back
        //
        if  (m == null) {
            return null;
        }

        System.out.println("Map toString looks like: " + m.toString());

        // Sort the keys in the Map
        //
        TreeMap<K, V> nset = new TreeMap<K, V>(m);

        System.out.println("Tree map looks like: " + nset.toString());
        return nset.toString();
    }

    public List<String> realElements(List<String> elements) {
        return elements.subList(Token.MIN_USER_TOKEN_TYPE, elements.size());
    }

    public void assertNotNullOrEmpty(String message, String text) {
        assertNotNull(message, text);
        assertFalse(message, text.isEmpty());
    }

    public void assertNotNullOrEmpty(String text) {
        assertNotNull(text);
        assertFalse(text.isEmpty());
    }
}
