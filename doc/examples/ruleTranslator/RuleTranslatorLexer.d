// Generated from RuleTranslator.g4 by ANTLR 4.7.1
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.InterfaceRuleContext;
import antlr.v4.runtime.RuntimeMetaData;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.LexerATNSimulator;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.LexerNoViableAltException;

public class RuleTranslatorLexer : Lexer {
    alias recover = Lexer.recover;
    static this() { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public static immutable int
		STRING=1, NUMBER=2, INTEGER=3, DEF=4, RETURN=5, RAISE=6, FROM=7, IMPORT=8, 
		AS=9, GLOBAL=10, NONLOCAL=11, ASSERT=12, IF=13, ELIF=14, ELSE=15, WHILE=16, 
		FOR=17, IN=18, TRY=19, FINALLY=20, WITH=21, EXCEPT=22, LAMBDA=23, OR=24, 
		AND=25, NOT=26, IS=27, NONE=28, TRUE=29, FALSE=30, CLASS=31, YIELD=32, 
		DEL=33, PASS=34, CONTINUE=35, BREAK=36, ASYNC=37, AWAIT=38, NEWLINE=39, 
		NAME=40, STRING_LITERAL=41, BYTES_LITERAL=42, DECIMAL_INTEGER=43, OCT_INTEGER=44, 
		HEX_INTEGER=45, BIN_INTEGER=46, FLOAT_NUMBER=47, IMAG_NUMBER=48, DOT=49, 
		ELLIPSIS=50, STAR=51, OPEN_PAREN=52, CLOSE_PAREN=53, COMMA=54, COLON=55, 
		SEMI_COLON=56, POWER=57, ASSIGN=58, OPEN_BRACK=59, CLOSE_BRACK=60, OR_OP=61, 
		XOR=62, AND_OP=63, LEFT_SHIFT=64, RIGHT_SHIFT=65, ADD=66, MINUS=67, DIV=68, 
		MOD=69, IDIV=70, NOT_OP=71, OPEN_BRACE=72, CLOSE_BRACE=73, LESS_THAN=74, 
		GREATER_THAN=75, EQUALS=76, GT_EQ=77, LT_EQ=78, NOT_EQ_1=79, NOT_EQ_2=80, 
		AT=81, ARROW=82, ADD_ASSIGN=83, SUB_ASSIGN=84, MULT_ASSIGN=85, AT_ASSIGN=86, 
		DIV_ASSIGN=87, MOD_ASSIGN=88, AND_ASSIGN=89, OR_ASSIGN=90, XOR_ASSIGN=91, 
		LEFT_SHIFT_ASSIGN=92, RIGHT_SHIFT_ASSIGN=93, POWER_ASSIGN=94, IDIV_ASSIGN=95, 
		SKIP_=96, UNKNOWN_CHAR=97;
    public static string[] channelNames = [
        "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
    ];
	public static string[] modeNames = [
		"DEFAULT_MODE"
	];

	public static string[] ruleNames = [
		"STRING", "NUMBER", "INTEGER", "DEF", "RETURN", "RAISE", "FROM", "IMPORT", 
		"AS", "GLOBAL", "NONLOCAL", "ASSERT", "IF", "ELIF", "ELSE", "WHILE", "FOR", 
		"IN", "TRY", "FINALLY", "WITH", "EXCEPT", "LAMBDA", "OR", "AND", "NOT", 
		"IS", "NONE", "TRUE", "FALSE", "CLASS", "YIELD", "DEL", "PASS", "CONTINUE", 
		"BREAK", "ASYNC", "AWAIT", "NEWLINE", "NAME", "STRING_LITERAL", "BYTES_LITERAL", 
		"DECIMAL_INTEGER", "OCT_INTEGER", "HEX_INTEGER", "BIN_INTEGER", "FLOAT_NUMBER", 
		"IMAG_NUMBER", "DOT", "ELLIPSIS", "STAR", "OPEN_PAREN", "CLOSE_PAREN", 
		"COMMA", "COLON", "SEMI_COLON", "POWER", "ASSIGN", "OPEN_BRACK", "CLOSE_BRACK", 
		"OR_OP", "XOR", "AND_OP", "LEFT_SHIFT", "RIGHT_SHIFT", "ADD", "MINUS", 
		"DIV", "MOD", "IDIV", "NOT_OP", "OPEN_BRACE", "CLOSE_BRACE", "LESS_THAN", 
		"GREATER_THAN", "EQUALS", "GT_EQ", "LT_EQ", "NOT_EQ_1", "NOT_EQ_2", "AT", 
		"ARROW", "ADD_ASSIGN", "SUB_ASSIGN", "MULT_ASSIGN", "AT_ASSIGN", "DIV_ASSIGN", 
		"MOD_ASSIGN", "AND_ASSIGN", "OR_ASSIGN", "XOR_ASSIGN", "LEFT_SHIFT_ASSIGN", 
		"RIGHT_SHIFT_ASSIGN", "POWER_ASSIGN", "IDIV_ASSIGN", "SKIP_", "UNKNOWN_CHAR", 
		"SHORT_STRING", "LONG_STRING", "LONG_STRING_ITEM", "LONG_STRING_CHAR", 
		"STRING_ESCAPE_SEQ", "NON_ZERO_DIGIT", "DIGIT", "OCT_DIGIT", "HEX_DIGIT", 
		"BIN_DIGIT", "POINT_FLOAT", "EXPONENT_FLOAT", "INT_PART", "FRACTION", 
		"EXPONENT", "SHORT_BYTES", "LONG_BYTES", "LONG_BYTES_ITEM", "SHORT_BYTES_CHAR_NO_SINGLE_QUOTE", 
		"SHORT_BYTES_CHAR_NO_DOUBLE_QUOTE", "LONG_BYTES_CHAR", "BYTES_ESCAPE_SEQ", 
		"SPACES", "COMMENT", "LINE_JOINING", "ID_START", "ID_CONTINUE"
	];

	private static const string[] _LITERAL_NAMES = [
		null, null, null, null, "'def'", "'return'", "'raise'", "'from'", "'import'", 
		"'as'", "'global'", "'nonlocal'", "'assert'", "'if'", "'elif'", "'else'", 
		"'while'", "'for'", "'in'", "'try'", "'finally'", "'with'", "'except'", 
		"'lambda'", "'or'", "'and'", "'not'", "'is'", "'None'", "'True'", "'False'", 
		"'class'", "'yield'", "'del'", "'pass'", "'continue'", "'break'", "'async'", 
		"'await'", null, null, null, null, null, null, null, null, null, null, 
		"'.'", "'...'", "'*'", "'('", "')'", "','", "':'", "';'", "'**'", "'='", 
		"'['", "']'", "'|'", "'^'", "'&'", "'<<'", "'>>'", "'+'", "'-'", "'/'", 
		"'%'", "'//'", "'~'", "'{'", "'}'", "'<'", "'>'", "'=='", "'>='", "'<='", 
		"'<>'", "'!='", "'@'", "'->'", "'+='", "'-='", "'*='", "'@='", "'/='", 
		"'%='", "'&='", "'|='", "'^='", "'<<='", "'>>='", "'**='", "'//='"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null, "STRING", "NUMBER", "INTEGER", "DEF", "RETURN", "RAISE", "FROM", 
		"IMPORT", "AS", "GLOBAL", "NONLOCAL", "ASSERT", "IF", "ELIF", "ELSE", 
		"WHILE", "FOR", "IN", "TRY", "FINALLY", "WITH", "EXCEPT", "LAMBDA", "OR", 
		"AND", "NOT", "IS", "NONE", "TRUE", "FALSE", "CLASS", "YIELD", "DEL", 
		"PASS", "CONTINUE", "BREAK", "ASYNC", "AWAIT", "NEWLINE", "NAME", "STRING_LITERAL", 
		"BYTES_LITERAL", "DECIMAL_INTEGER", "OCT_INTEGER", "HEX_INTEGER", "BIN_INTEGER", 
		"FLOAT_NUMBER", "IMAG_NUMBER", "DOT", "ELLIPSIS", "STAR", "OPEN_PAREN", 
		"CLOSE_PAREN", "COMMA", "COLON", "SEMI_COLON", "POWER", "ASSIGN", "OPEN_BRACK", 
		"CLOSE_BRACK", "OR_OP", "XOR", "AND_OP", "LEFT_SHIFT", "RIGHT_SHIFT", 
		"ADD", "MINUS", "DIV", "MOD", "IDIV", "NOT_OP", "OPEN_BRACE", "CLOSE_BRACE", 
		"LESS_THAN", "GREATER_THAN", "EQUALS", "GT_EQ", "LT_EQ", "NOT_EQ_1", "NOT_EQ_2", 
		"AT", "ARROW", "ADD_ASSIGN", "SUB_ASSIGN", "MULT_ASSIGN", "AT_ASSIGN", 
		"DIV_ASSIGN", "MOD_ASSIGN", "AND_ASSIGN", "OR_ASSIGN", "XOR_ASSIGN", "LEFT_SHIFT_ASSIGN", 
		"RIGHT_SHIFT_ASSIGN", "POWER_ASSIGN", "IDIV_ASSIGN", "SKIP_", "UNKNOWN_CHAR"
	];
	public static Vocabulary VOCABULARY;

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	public static string[] tokenNames;

	static this() {
	    VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);
	    string[_SYMBOLIC_NAMES.length] tokenNames;
	    for (int i = 0; i < tokenNames.length; i++) {
	        tokenNames[i] = VOCABULARY.getLiteralName(i);
	            if (tokenNames[i] is null) {
	                tokenNames[i] = VOCABULARY.getSymbolicName(i);
		    }

	            if (tokenNames[i] is null) {
	                tokenNames[i] = "<INVALID>";
	            }
	    }
	}

	override public string[] getTokenNames() {
		return tokenNames;
	}

	override public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	  import antlr.v4.runtime.CommonToken;
	  import antlr.v4.runtime.RuleContext;
	  import antlr.v4.runtime.TokenConstantDefinition;
	  import std.container : DList;
	  import std.conv;
	  import RuleTranslatorParser : RuleTranslatorParser;
	  // A queue where extra tokens are pushed on (see the NEWLINE lexer rule).
	  private DList!Token tokens;
	  // The stack that keeps track of the indentation level.
	  private DList!int indents;
	  // The amount of opened braces, brackets and parenthesis.
	  private int opened = 0;
	  // The most recently produced token.
	  private Token lastToken;
	  public override void emit(Token t) {
	    super.setToken(t);
	    tokens.insertBack(t);
	  }

	  public override Token nextToken() {
	    // Check if the end-of-file is ahead and there are still some DEDENTS expected.
	    if (_input.LA(1) == EOF && !this.indents.empty) {
	      // Remove any trailing EOF tokens from our buffer.
	      {
	      	  if (tokens.back.getType == EOF) {
	                tokens.removeBack();
		  }
	      } while (!this.indents.empty)

	      // First emit an extra line break that serves as the end of the statement.
	      this.emit(commonToken(RuleTranslatorParser.NEWLINE, "\n"));

	      // Now emit as much DEDENT tokens as needed.
	      while (!indents.empty()) {
	        this.emit(createDedent());
	        indents.removeBack;
	      }

	      // Put the EOF back on the token stream.
	      this.emit(commonToken(RuleTranslatorParser.EOF, "<EOF>"));
	    }

	    Token next = super.nextToken();

	    if (next.getChannel() == TokenConstantDefinition.DEFAULT_CHANNEL) {
	      // Keep track of the last token on the default channel.
	      this.lastToken = next;
	    }
	    
	    if(tokens.empty)
	        return next;
	    else {
	        auto res = tokens.front;
	        tokens.removeFront();
	        return res;
	    }
	  }

	  private Token createDedent() {
	    CommonToken dedent = commonToken(RuleTranslatorParser.DEDENT, "");
	    dedent.setLine(this.lastToken.getLine());
	    return dedent;
	  }

	  private CommonToken commonToken(int type, string text) {
	    int stop = this.getCharIndex() - 1;
	    int start = to!int(text.length == 0 ? stop : stop - text.length + 1);
	    return new CommonToken(this._tokenFactorySourcePair, type, DEFAULT_TOKEN_CHANNEL, start, stop);
	  }

	  // Calculates the indentation of the provided spaces, taking the
	  // following rules into account:
	  //
	  // "Tabs are replaced (from left to right) by one to eight spaces
	  //  such that the total number of characters up to and including
	  //  the replacement is a multiple of eight [...]"
	  //
	  //  -- https://docs.python.org/3.1/reference/lexical_analysis.html#indentation
	  static int getIndentationCount(string spaces) {
	    int count = 0;
	    foreach (char ch; spaces) {
	      switch (ch) {
	        case '\t':
	          count += 8 - (count % 8);
	          break;
	        default:
	          // A normal space char.
	          count++;
	      }
	    }

	    return count;
	  }

	  bool atStartOfInput() {
	    return super.getCharPositionInLine() == 0 && super.getLine() == 1;
	  }


	public this(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	override
	public string getGrammarFileName() { return "RuleTranslator.g4"; }

	override
	public string[] getRuleNames() { return ruleNames; }

	override
	public wstring getSerializedATN() { return _serializedATN; }

        override
	public string[] getChannelNames() { return channelNames; }

	override
	public string[] getModeNames() { return modeNames; }

	override
	public ATN getATN() { return _ATN; }

	override
	public void action(InterfaceRuleContext _localctx, int ruleIndex, int actionIndex) {
		switch (ruleIndex) {
		case 38:
			NEWLINE_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
		case 51:
			OPEN_PAREN_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
		case 52:
			CLOSE_PAREN_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
		case 58:
			OPEN_BRACK_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
		case 59:
			CLOSE_BRACK_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
		case 71:
			OPEN_BRACE_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
		case 72:
			CLOSE_BRACE_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
	        default: {}
		}
	}
	private void NEWLINE_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 0:

			     import std.regex;
			     string newLine = getText().replaceAll(regex(r"[^\r\n\f]+"), "");
			     string spaces = getText().replaceAll(regex(r"[\r\n\f]+"), "");
			     int next = _input.LA(1);
			     if (opened > 0 || next == '\r' || next == '\n' || next == '\f' || next == '#') {
			       // If we're inside a list or on a blank line, ignore all indents, 
			       // dedents and line breaks.
			       skip();
			     }
			     else {
			       emit(commonToken(NEWLINE, newLine));
			       int indent = getIndentationCount(spaces);
			       int previous = indents.empty ? 0 : indents.front;
			       if (indent == previous) {
			         // skip indents of the same size as the present indent-size
			         skip();
			       }
			       else if (indent > previous) {
			         indents.insertFront(indent);
			         emit(commonToken(RuleTranslatorParser.INDENT, spaces));
			       }
			       else {
			         // Possibly emit more than 1 DEDENT token.
			         while(!indents.empty() && indents.front > indent) {
			           this.emit(createDedent());
			           indents.removeFront();
			         }
			       }
			     }
			   
			break;
	        default: {}
		}
	}
	private void OPEN_PAREN_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 1:
			opened++;
			break;
	        default: {}
		}
	}
	private void CLOSE_PAREN_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 2:
			opened--;
			break;
	        default: {}
		}
	}
	private void OPEN_BRACK_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 3:
			opened++;
			break;
	        default: {}
		}
	}
	private void CLOSE_BRACK_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 4:
			opened--;
			break;
	        default: {}
		}
	}
	private void OPEN_BRACE_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 5:
			opened++;
			break;
	        default: {}
		}
	}
	private void CLOSE_BRACE_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 6:
			opened--;
			break;
	        default: {}
		}
	}
	override
	public bool sempred(InterfaceRuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 38:
			return NEWLINE_sempred(cast(RuleContext)_localctx, predIndex);
		default: {}
		}
		return true;
	}
	private bool NEWLINE_sempred(RuleContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return atStartOfInput();
	        default: {}
		}
		return true;
	}

	public static immutable wstring _serializedATN =
		"\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x02c\u0373\b\x01"~
		"\x04\x02\t\x02\x04\x03\t\x03\x04\x04\t\x04\x04\x05\t\x05\x04\x06\t\x06"~
		"\x04\x07\t\x07\x04\b\t\b\x04\t\t\t\x04\n\t\n\x04\x0b\t\x0b\x04\f\t\f\x04"~
		"\r\t\r\x04\x0e\t\x0e\x04\x0f\t\x0f\x04\x10\t\x10\x04\x11\t\x11\x04\x12"~
		"\t\x12\x04\x13\t\x13\x04\x14\t\x14\x04\x15\t\x15\x04\x16\t\x16\x04\x17"~
		"\t\x17\x04\x18\t\x18\x04\x19\t\x19\x04\x1a\t\x1a\x04\x1b\t\x1b\x04\x1c"~
		"\t\x1c\x04\x1d\t\x1d\x04\x1e\t\x1e\x04\x1f\t\x1f\x04 \t \x04!\t!\x04\""~
		"\t\"\x04#\t#\x04$\t$\x04%\t%\x04&\t&\x04\'\t\'\x04(\t(\x04)\t)\x04*\t"~
		"*\x04+\t+\x04,\t,\x04-\t-\x04.\t.\x04/\t/\x040\t0\x041\t1\x042\t2\x04"~
		"3\t3\x044\t4\x045\t5\x046\t6\x047\t7\x048\t8\x049\t9\x04:\t:\x04;\t;\x04"~
		"<\t<\x04=\t=\x04>\t>\x04?\t?\x04@\t@\x04A\tA\x04B\tB\x04C\tC\x04D\tD\x04"~
		"E\tE\x04F\tF\x04G\tG\x04H\tH\x04I\tI\x04J\tJ\x04K\tK\x04L\tL\x04M\tM\x04"~
		"N\tN\x04O\tO\x04P\tP\x04Q\tQ\x04R\tR\x04S\tS\x04T\tT\x04U\tU\x04V\tV\x04"~
		"W\tW\x04X\tX\x04Y\tY\x04Z\tZ\x04[\t[\x04\\\t\\\x04]\t]\x04^\t^\x04_\t"~
		"_\x04`\t`\x04a\ta\x04b\tb\x04c\tc\x04d\td\x04e\te\x04f\tf\x04g\tg\x04"~
		"h\th\x04i\ti\x04j\tj\x04k\tk\x04l\tl\x04m\tm\x04n\tn\x04o\to\x04p\tp\x04"~
		"q\tq\x04r\tr\x04s\ts\x04t\tt\x04u\tu\x04v\tv\x04w\tw\x04x\tx\x04y\ty\x04"~
		"z\tz\x04{\t{\x04|\t|\x04}\t}\x03\x02\x03\x02\x05\x02\u00fe\n\x02\x03\x03"~
		"\x03\x03\x03\x03\x05\x03\u0103\n\x03\x03\x04\x03\x04\x03\x04\x03\x04\x05"~
		"\x04\u0109\n\x04\x03\x05\x03\x05\x03\x05\x03\x05\x03\x06\x03\x06\x03\x06"~
		"\x03\x06\x03\x06\x03\x06\x03\x06\x03\x07\x03\x07\x03\x07\x03\x07\x03\x07"~
		"\x03\x07\x03\b\x03\b\x03\b\x03\b\x03\b\x03\t\x03\t\x03\t\x03\t\x03\t\x03"~
		"\t\x03\t\x03\n\x03\n\x03\n\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x03"~
		"\x0b\x03\x0b\x03\f\x03\f\x03\f\x03\f\x03\f\x03\f\x03\f\x03\f\x03\f\x03"~
		"\r\x03\r\x03\r\x03\r\x03\r\x03\r\x03\r\x03\x0e\x03\x0e\x03\x0e\x03\x0f"~
		"\x03\x0f\x03\x0f\x03\x0f\x03\x0f\x03\x10\x03\x10\x03\x10\x03\x10\x03\x10"~
		"\x03\x11\x03\x11\x03\x11\x03\x11\x03\x11\x03\x11\x03\x12\x03\x12\x03\x12"~
		"\x03\x12\x03\x13\x03\x13\x03\x13\x03\x14\x03\x14\x03\x14\x03\x14\x03\x15"~
		"\x03\x15\x03\x15\x03\x15\x03\x15\x03\x15\x03\x15\x03\x15\x03\x16\x03\x16"~
		"\x03\x16\x03\x16\x03\x16\x03\x17\x03\x17\x03\x17\x03\x17\x03\x17\x03\x17"~
		"\x03\x17\x03\x18\x03\x18\x03\x18\x03\x18\x03\x18\x03\x18\x03\x18\x03\x19"~
		"\x03\x19\x03\x19\x03\x1a\x03\x1a\x03\x1a\x03\x1a\x03\x1b\x03\x1b\x03\x1b"~
		"\x03\x1b\x03\x1c\x03\x1c\x03\x1c\x03\x1d\x03\x1d\x03\x1d\x03\x1d\x03\x1d"~
		"\x03\x1e\x03\x1e\x03\x1e\x03\x1e\x03\x1e\x03\x1f\x03\x1f\x03\x1f\x03\x1f"~
		"\x03\x1f\x03\x1f\x03 \x03 \x03 \x03 \x03 \x03 \x03!\x03!\x03!\x03!\x03"~
		"!\x03!\x03\"\x03\"\x03\"\x03\"\x03#\x03#\x03#\x03#\x03#\x03$\x03$\x03"~
		"$\x03$\x03$\x03$\x03$\x03$\x03$\x03%\x03%\x03%\x03%\x03%\x03%\x03&\x03"~
		"&\x03&\x03&\x03&\x03&\x03\'\x03\'\x03\'\x03\'\x03\'\x03\'\x03(\x03(\x03"~
		"(\x05(\u01cc\n(\x03(\x03(\x05(\u01d0\n(\x03(\x05(\u01d3\n(\x05(\u01d5"~
		"\n(\x03(\x03(\x03)\x03)\x07)\u01db\n)\f)\x0e)\u01de\x0b)\x03*\x03*\x03"~
		"*\x03*\x03*\x05*\u01e5\n*\x03*\x03*\x05*\u01e9\n*\x03+\x03+\x03+\x03+"~
		"\x03+\x05+\u01f0\n+\x03+\x03+\x05+\u01f4\n+\x03,\x03,\x07,\u01f8\n,\f"~
		",\x0e,\u01fb\x0b,\x03,\x06,\u01fe\n,\r,\x0e,\u01ff\x05,\u0202\n,\x03-"~
		"\x03-\x03-\x06-\u0207\n-\r-\x0e-\u0208\x03.\x03.\x03.\x06.\u020e\n.\r"~
		".\x0e.\u020f\x03/\x03/\x03/\x06/\u0215\n/\r/\x0e/\u0216\x030\x030\x05"~
		"0\u021b\n0\x031\x031\x051\u021f\n1\x031\x031\x032\x032\x033\x033\x033"~
		"\x033\x034\x034\x035\x035\x035\x036\x036\x036\x037\x037\x038\x038\x03"~
		"9\x039\x03:\x03:\x03:\x03;\x03;\x03<\x03<\x03<\x03=\x03=\x03=\x03>\x03"~
		">\x03?\x03?\x03@\x03@\x03A\x03A\x03A\x03B\x03B\x03B\x03C\x03C\x03D\x03"~
		"D\x03E\x03E\x03F\x03F\x03G\x03G\x03G\x03H\x03H\x03I\x03I\x03I\x03J\x03"~
		"J\x03J\x03K\x03K\x03L\x03L\x03M\x03M\x03M\x03N\x03N\x03N\x03O\x03O\x03"~
		"O\x03P\x03P\x03P\x03Q\x03Q\x03Q\x03R\x03R\x03S\x03S\x03S\x03T\x03T\x03"~
		"T\x03U\x03U\x03U\x03V\x03V\x03V\x03W\x03W\x03W\x03X\x03X\x03X\x03Y\x03"~
		"Y\x03Y\x03Z\x03Z\x03Z\x03[\x03[\x03[\x03\\\x03\\\x03\\\x03]\x03]\x03]"~
		"\x03]\x03^\x03^\x03^\x03^\x03_\x03_\x03_\x03_\x03`\x03`\x03`\x03`\x03"~
		"a\x03a\x03a\x05a\u02a7\na\x03a\x03a\x03b\x03b\x03c\x03c\x03c\x07c\u02b0"~
		"\nc\fc\x0ec\u02b3\x0bc\x03c\x03c\x03c\x03c\x07c\u02b9\nc\fc\x0ec\u02bc"~
		"\x0bc\x03c\x05c\u02bf\nc\x03d\x03d\x03d\x03d\x03d\x07d\u02c6\nd\fd\x0e"~
		"d\u02c9\x0bd\x03d\x03d\x03d\x03d\x03d\x03d\x03d\x03d\x07d\u02d3\nd\fd"~
		"\x0ed\u02d6\x0bd\x03d\x03d\x03d\x05d\u02db\nd\x03e\x03e\x05e\u02df\ne"~
		"\x03f\x03f\x03g\x03g\x03g\x03g\x05g\u02e7\ng\x03h\x03h\x03i\x03i\x03j"~
		"\x03j\x03k\x03k\x03l\x03l\x03m\x05m\u02f4\nm\x03m\x03m\x03m\x03m\x05m"~
		"\u02fa\nm\x03n\x03n\x05n\u02fe\nn\x03n\x03n\x03o\x06o\u0303\no\ro\x0e"~
		"o\u0304\x03p\x03p\x06p\u0309\np\rp\x0ep\u030a\x03q\x03q\x05q\u030f\nq"~
		"\x03q\x06q\u0312\nq\rq\x0eq\u0313\x03r\x03r\x03r\x07r\u0319\nr\fr\x0e"~
		"r\u031c\x0br\x03r\x03r\x03r\x03r\x07r\u0322\nr\fr\x0er\u0325\x0br\x03"~
		"r\x05r\u0328\nr\x03s\x03s\x03s\x03s\x03s\x07s\u032f\ns\fs\x0es\u0332\x0b"~
		"s\x03s\x03s\x03s\x03s\x03s\x03s\x03s\x03s\x07s\u033c\ns\fs\x0es\u033f"~
		"\x0bs\x03s\x03s\x03s\x05s\u0344\ns\x03t\x03t\x05t\u0348\nt\x03u\x05u\u034b"~
		"\nu\x03v\x05v\u034e\nv\x03w\x05w\u0351\nw\x03x\x03x\x03x\x03y\x06y\u0357"~
		"\ny\ry\x0ey\u0358\x03z\x03z\x07z\u035d\nz\fz\x0ez\u0360\x0bz\x03{\x03"~
		"{\x05{\u0364\n{\x03{\x05{\u0367\n{\x03{\x03{\x05{\u036b\n{\x03|\x05|\u036e"~
		"\n|\x03}\x03}\x05}\u0372\n}\x06\u02c7\u02d4\u0330\u033d\x02~\x03\x03\x05"~
		"\x04\x07\x05\t\x06\x0b\x07\r\b\x0f\t\x11\n\x13\x0b\x15\f\x17\r\x19\x0e"~
		"\x1b\x0f\x1d\x10\x1f\x11!\x12#\x13%\x14\'\x15)\x16+\x17-\x18/\x191\x1a"~
		"3\x1b5\x1c7\x1d9\x1e;\x1f= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]0_1a2c3e4"~
		"g5i6k7m8o9q:s;u<w=y>{?}@\x7fA\u0081B\u0083C\u0085D\u0087E\u0089F\u008b"~
		"G\u008dH\u008fI\u0091J\u0093K\u0095L\u0097M\u0099N\u009bO\u009dP\u009f"~
		"Q\u00a1R\u00a3S\u00a5T\u00a7U\u00a9V\u00abW\u00adX\u00afY\u00b1Z\u00b3"~
		"[\u00b5\\\u00b7]\u00b9^\u00bb_\u00bd`\u00bfa\u00c1b\u00c3c\u00c5\x02\u00c7"~
		"\x02\u00c9\x02\u00cb\x02\u00cd\x02\u00cf\x02\u00d1\x02\u00d3\x02\u00d5"~
		"\x02\u00d7\x02\u00d9\x02\u00db\x02\u00dd\x02\u00df\x02\u00e1\x02\u00e3"~
		"\x02\u00e5\x02\u00e7\x02\u00e9\x02\u00eb\x02\u00ed\x02\u00ef\x02\u00f1"~
		"\x02\u00f3\x02\u00f5\x02\u00f7\x02\u00f9\x02\x03\x02\x1b\b\x02HHTTWWh"~
		"httww\x04\x02HHhh\x04\x02TTtt\x04\x02DDdd\x04\x02QQqq\x04\x02ZZzz\x04"~
		"\x02LLll\x06\x02\f\f\x0e\x0f))^^\x06\x02\f\f\x0e\x0f$$^^\x03\x02^^\x03"~
		"\x023;\x03\x022;\x03\x0229\x05\x022;CHch\x03\x0223\x04\x02GGgg\x04\x02"~
		"--//\x07\x02\x02\x0b\r\x0e\x10(*]_\u0081\x07\x02\x02\x0b\r\x0e\x10#%]"~
		"_\u0081\x04\x02\x02]_\u0081\x03\x02\x02\u0081\x04\x02\x0b\x0b\"\"\x04"~
		"\x02\f\f\x0e\x0f\u0129\x02C\\aac|\u00ac\u00ac\u00b7\u00b7\u00bc\u00bc"~
		"\u00c2\u00d8\u00da\u00f8\u00fa\u0243\u0252\u02c3\u02c8\u02d3\u02e2\u02e6"~
		"\u02f0\u02f0\u037c\u037c\u0388\u0388\u038a\u038c\u038e\u038e\u0390\u03a3"~
		"\u03a5\u03d0\u03d2\u03f7\u03f9\u0483\u048c\u04d0\u04d2\u04fb\u0502\u0511"~
		"\u0533\u0558\u055b\u055b\u0563\u0589\u05d2\u05ec\u05f2\u05f4\u0623\u063c"~
		"\u0642\u064c\u0670\u0671\u0673\u06d5\u06d7\u06d7\u06e7\u06e8\u06f0\u06f1"~
		"\u06fc\u06fe\u0701\u0701\u0712\u0712\u0714\u0731\u074f\u076f\u0782\u07a7"~
		"\u07b3\u07b3\u0906\u093b\u093f\u093f\u0952\u0952\u095a\u0963\u097f\u097f"~
		"\u0987\u098e\u0991\u0992\u0995\u09aa\u09ac\u09b2\u09b4\u09b4\u09b8\u09bb"~
		"\u09bf\u09bf\u09d0\u09d0\u09de\u09df\u09e1\u09e3\u09f2\u09f3\u0a07\u0a0c"~
		"\u0a11\u0a12\u0a15\u0a2a\u0a2c\u0a32\u0a34\u0a35\u0a37\u0a38\u0a3a\u0a3b"~
		"\u0a5b\u0a5e\u0a60\u0a60\u0a74\u0a76\u0a87\u0a8f\u0a91\u0a93\u0a95\u0aaa"~
		"\u0aac\u0ab2\u0ab4\u0ab5\u0ab7\u0abb\u0abf\u0abf\u0ad2\u0ad2\u0ae2\u0ae3"~
		"\u0b07\u0b0e\u0b11\u0b12\u0b15\u0b2a\u0b2c\u0b32\u0b34\u0b35\u0b37\u0b3b"~
		"\u0b3f\u0b3f\u0b5e\u0b5f\u0b61\u0b63\u0b73\u0b73\u0b85\u0b85\u0b87\u0b8c"~
		"\u0b90\u0b92\u0b94\u0b97\u0b9b\u0b9c\u0b9e\u0b9e\u0ba0\u0ba1\u0ba5\u0ba6"~
		"\u0baa\u0bac\u0bb0\u0bbb\u0c07\u0c0e\u0c10\u0c12\u0c14\u0c2a\u0c2c\u0c35"~
		"\u0c37\u0c3b\u0c62\u0c63\u0c87\u0c8e\u0c90\u0c92\u0c94\u0caa\u0cac\u0cb5"~
		"\u0cb7\u0cbb\u0cbf\u0cbf\u0ce0\u0ce0\u0ce2\u0ce3\u0d07\u0d0e\u0d10\u0d12"~
		"\u0d14\u0d2a\u0d2c\u0d3b\u0d62\u0d63\u0d87\u0d98\u0d9c\u0db3\u0db5\u0dbd"~
		"\u0dbf\u0dbf\u0dc2\u0dc8\u0e03\u0e32\u0e34\u0e35\u0e42\u0e48\u0e83\u0e84"~
		"\u0e86\u0e86\u0e89\u0e8a\u0e8c\u0e8c\u0e8f\u0e8f\u0e96\u0e99\u0e9b\u0ea1"~
		"\u0ea3\u0ea5\u0ea7\u0ea7\u0ea9\u0ea9\u0eac\u0ead\u0eaf\u0eb2\u0eb4\u0eb5"~
		"\u0ebf\u0ebf\u0ec2\u0ec6\u0ec8\u0ec8\u0ede\u0edf\u0f02\u0f02\u0f42\u0f49"~
		"\u0f4b\u0f6c\u0f8a\u0f8d\u1002\u1023\u1025\u1029\u102b\u102c\u1052\u1057"~
		"\u10a2\u10c7\u10d2\u10fc\u10fe\u10fe\u1102\u115b\u1161\u11a4\u11aa\u11fb"~
		"\u1202\u124a\u124c\u124f\u1252\u1258\u125a\u125a\u125c\u125f\u1262\u128a"~
		"\u128c\u128f\u1292\u12b2\u12b4\u12b7\u12ba\u12c0\u12c2\u12c2\u12c4\u12c7"~
		"\u12ca\u12d8\u12da\u1312\u1314\u1317\u131a\u135c\u1382\u1391\u13a2\u13f6"~
		"\u1403\u166e\u1671\u1678\u1683\u169c\u16a2\u16ec\u16f0\u16f2\u1702\u170e"~
		"\u1710\u1713\u1722\u1733\u1742\u1753\u1762\u176e\u1770\u1772\u1782\u17b5"~
		"\u17d9\u17d9\u17de\u17de\u1822\u1879\u1882\u18aa\u1902\u191e\u1952\u196f"~
		"\u1972\u1976\u1982\u19ab\u19c3\u19c9\u1a02\u1a18\u1d02\u1dc1\u1e02\u1e9d"~
		"\u1ea2\u1efb\u1f02\u1f17\u1f1a\u1f1f\u1f22\u1f47\u1f4a\u1f4f\u1f52\u1f59"~
		"\u1f5b\u1f5b\u1f5d\u1f5d\u1f5f\u1f5f\u1f61\u1f7f\u1f82\u1fb6\u1fb8\u1fbe"~
		"\u1fc0\u1fc0\u1fc4\u1fc6\u1fc8\u1fce\u1fd2\u1fd5\u1fd8\u1fdd\u1fe2\u1fee"~
		"\u1ff4\u1ff6\u1ff8\u1ffe\u2073\u2073\u2081\u2081\u2092\u2096\u2104\u2104"~
		"\u2109\u2109\u210c\u2115\u2117\u2117\u211a\u211f\u2126\u2126\u2128\u2128"~
		"\u212a\u212a\u212c\u2133\u2135\u213b\u213e\u2141\u2147\u214b\u2162\u2185"~
		"\u2c02\u2c30\u2c32\u2c60\u2c82\u2ce6\u2d02\u2d27\u2d32\u2d67\u2d71\u2d71"~
		"\u2d82\u2d98\u2da2\u2da8\u2daa\u2db0\u2db2\u2db8\u2dba\u2dc0\u2dc2\u2dc8"~
		"\u2dca\u2dd0\u2dd2\u2dd8\u2dda\u2de0\u3007\u3009\u3023\u302b\u3033\u3037"~
		"\u303a\u303e\u3043\u3098\u309d\u30a1\u30a3\u30fc\u30fe\u3101\u3107\u312e"~
		"\u3133\u3190\u31a2\u31b9\u31f2\u3201\u3402\u4db7\u4e02\u9fbd\ua002\ua48e"~
		"\ua802\ua803\ua805\ua807\ua809\ua80c\ua80e\ua824\uac02\ud7a5\uf902\ufa2f"~
		"\ufa32\ufa6c\ufa72\ufadb\ufb02\ufb08\ufb15\ufb19\ufb1f\ufb1f\ufb21\ufb2a"~
		"\ufb2c\ufb38\ufb3a\ufb3e\ufb40\ufb40\ufb42\ufb43\ufb45\ufb46\ufb48\ufbb3"~
		"\ufbd5\ufd3f\ufd52\ufd91\ufd94\ufdc9\ufdf2\ufdfd\ufe72\ufe76\ufe78\ufefe"~
		"\uff23\uff3c\uff43\uff5c\uff68\uffc0\uffc4\uffc9\uffcc\uffd1\uffd4\uffd9"~
		"\uffdc\uffde\u0096\x022;\u0302\u0371\u0485\u0488\u0593\u05bb\u05bd\u05bf"~
		"\u05c1\u05c1\u05c3\u05c4\u05c6\u05c7\u05c9\u05c9\u0612\u0617\u064d\u0660"~
		"\u0662\u066b\u0672\u0672\u06d8\u06de\u06e1\u06e6\u06e9\u06ea\u06ec\u06ef"~
		"\u06f2\u06fb\u0713\u0713\u0732\u074c\u07a8\u07b2\u0903\u0905\u093e\u093e"~
		"\u0940\u094f\u0953\u0956\u0964\u0965\u0968\u0971\u0983\u0985\u09be\u09be"~
		"\u09c0\u09c6\u09c9\u09ca\u09cd\u09cf\u09d9\u09d9\u09e4\u09e5\u09e8\u09f1"~
		"\u0a03\u0a05\u0a3e\u0a3e\u0a40\u0a44\u0a49\u0a4a\u0a4d\u0a4f\u0a68\u0a73"~
		"\u0a83\u0a85\u0abe\u0abe\u0ac0\u0ac7\u0ac9\u0acb\u0acd\u0acf\u0ae4\u0ae5"~
		"\u0ae8\u0af1\u0b03\u0b05\u0b3e\u0b3e\u0b40\u0b45\u0b49\u0b4a\u0b4d\u0b4f"~
		"\u0b58\u0b59\u0b68\u0b71\u0b84\u0b84\u0bc0\u0bc4\u0bc8\u0bca\u0bcc\u0bcf"~
		"\u0bd9\u0bd9\u0be8\u0bf1\u0c03\u0c05\u0c40\u0c46\u0c48\u0c4a\u0c4c\u0c4f"~
		"\u0c57\u0c58\u0c68\u0c71\u0c84\u0c85\u0cbe\u0cbe\u0cc0\u0cc6\u0cc8\u0cca"~
		"\u0ccc\u0ccf\u0cd7\u0cd8\u0ce8\u0cf1\u0d04\u0d05\u0d40\u0d45\u0d48\u0d4a"~
		"\u0d4c\u0d4f\u0d59\u0d59\u0d68\u0d71\u0d84\u0d85\u0dcc\u0dcc\u0dd1\u0dd6"~
		"\u0dd8\u0dd8\u0dda\u0de1\u0df4\u0df5\u0e33\u0e33\u0e36\u0e3c\u0e49\u0e50"~
		"\u0e52\u0e5b\u0eb3\u0eb3\u0eb6\u0ebb\u0ebd\u0ebe\u0eca\u0ecf\u0ed2\u0edb"~
		"\u0f1a\u0f1b\u0f22\u0f2b\u0f37\u0f37\u0f39\u0f39\u0f3b\u0f3b\u0f40\u0f41"~
		"\u0f73\u0f86\u0f88\u0f89\u0f92\u0f99\u0f9b\u0fbe\u0fc8\u0fc8\u102e\u1034"~
		"\u1038\u103b\u1042\u104b\u1058\u105b\u1361\u1361\u136b\u1373\u1714\u1716"~
		"\u1734\u1736\u1754\u1755\u1774\u1775\u17b8\u17d5\u17df\u17df\u17e2\u17eb"~
		"\u180d\u180f\u1812\u181b\u18ab\u18ab\u1922\u192d\u1932\u193d\u1948\u1951"~
		"\u19b2\u19c2\u19ca\u19cb\u19d2\u19db\u1a19\u1a1d\u1dc2\u1dc5\u2041\u2042"~
		"\u2056\u2056\u20d2\u20de\u20e3\u20e3\u20e7\u20ed\u302c\u3031\u309b\u309c"~
		"\ua804\ua804\ua808\ua808\ua80d\ua80d\ua825\ua829\ufb20\ufb20\ufe02\ufe11"~
		"\ufe22\ufe25\ufe35\ufe36\ufe4f\ufe51\uff12\uff1b\uff41\uff41\x02\u0393"~
		"\x02\x03\x03\x02\x02\x02\x02\x05\x03\x02\x02\x02\x02\x07\x03\x02\x02\x02"~
		"\x02\t\x03\x02\x02\x02\x02\x0b\x03\x02\x02\x02\x02\r\x03\x02\x02\x02\x02"~
		"\x0f\x03\x02\x02\x02\x02\x11\x03\x02\x02\x02\x02\x13\x03\x02\x02\x02\x02"~
		"\x15\x03\x02\x02\x02\x02\x17\x03\x02\x02\x02\x02\x19\x03\x02\x02\x02\x02"~
		"\x1b\x03\x02\x02\x02\x02\x1d\x03\x02\x02\x02\x02\x1f\x03\x02\x02\x02\x02"~
		"!\x03\x02\x02\x02\x02#\x03\x02\x02\x02\x02%\x03\x02\x02\x02\x02\'\x03"~
		"\x02\x02\x02\x02)\x03\x02\x02\x02\x02+\x03\x02\x02\x02\x02-\x03\x02\x02"~
		"\x02\x02/\x03\x02\x02\x02\x021\x03\x02\x02\x02\x023\x03\x02\x02\x02\x02"~
		"5\x03\x02\x02\x02\x027\x03\x02\x02\x02\x029\x03\x02\x02\x02\x02;\x03\x02"~
		"\x02\x02\x02=\x03\x02\x02\x02\x02?\x03\x02\x02\x02\x02A\x03\x02\x02\x02"~
		"\x02C\x03\x02\x02\x02\x02E\x03\x02\x02\x02\x02G\x03\x02\x02\x02\x02I\x03"~
		"\x02\x02\x02\x02K\x03\x02\x02\x02\x02M\x03\x02\x02\x02\x02O\x03\x02\x02"~
		"\x02\x02Q\x03\x02\x02\x02\x02S\x03\x02\x02\x02\x02U\x03\x02\x02\x02\x02"~
		"W\x03\x02\x02\x02\x02Y\x03\x02\x02\x02\x02[\x03\x02\x02\x02\x02]\x03\x02"~
		"\x02\x02\x02_\x03\x02\x02\x02\x02a\x03\x02\x02\x02\x02c\x03\x02\x02\x02"~
		"\x02e\x03\x02\x02\x02\x02g\x03\x02\x02\x02\x02i\x03\x02\x02\x02\x02k\x03"~
		"\x02\x02\x02\x02m\x03\x02\x02\x02\x02o\x03\x02\x02\x02\x02q\x03\x02\x02"~
		"\x02\x02s\x03\x02\x02\x02\x02u\x03\x02\x02\x02\x02w\x03\x02\x02\x02\x02"~
		"y\x03\x02\x02\x02\x02{\x03\x02\x02\x02\x02}\x03\x02\x02\x02\x02\x7f\x03"~
		"\x02\x02\x02\x02\u0081\x03\x02\x02\x02\x02\u0083\x03\x02\x02\x02\x02\u0085"~
		"\x03\x02\x02\x02\x02\u0087\x03\x02\x02\x02\x02\u0089\x03\x02\x02\x02\x02"~
		"\u008b\x03\x02\x02\x02\x02\u008d\x03\x02\x02\x02\x02\u008f\x03\x02\x02"~
		"\x02\x02\u0091\x03\x02\x02\x02\x02\u0093\x03\x02\x02\x02\x02\u0095\x03"~
		"\x02\x02\x02\x02\u0097\x03\x02\x02\x02\x02\u0099\x03\x02\x02\x02\x02\u009b"~
		"\x03\x02\x02\x02\x02\u009d\x03\x02\x02\x02\x02\u009f\x03\x02\x02\x02\x02"~
		"\u00a1\x03\x02\x02\x02\x02\u00a3\x03\x02\x02\x02\x02\u00a5\x03\x02\x02"~
		"\x02\x02\u00a7\x03\x02\x02\x02\x02\u00a9\x03\x02\x02\x02\x02\u00ab\x03"~
		"\x02\x02\x02\x02\u00ad\x03\x02\x02\x02\x02\u00af\x03\x02\x02\x02\x02\u00b1"~
		"\x03\x02\x02\x02\x02\u00b3\x03\x02\x02\x02\x02\u00b5\x03\x02\x02\x02\x02"~
		"\u00b7\x03\x02\x02\x02\x02\u00b9\x03\x02\x02\x02\x02\u00bb\x03\x02\x02"~
		"\x02\x02\u00bd\x03\x02\x02\x02\x02\u00bf\x03\x02\x02\x02\x02\u00c1\x03"~
		"\x02\x02\x02\x02\u00c3\x03\x02\x02\x02\x03\u00fd\x03\x02\x02\x02\x05\u0102"~
		"\x03\x02\x02\x02\x07\u0108\x03\x02\x02\x02\t\u010a\x03\x02\x02\x02\x0b"~
		"\u010e\x03\x02\x02\x02\r\u0115\x03\x02\x02\x02\x0f\u011b\x03\x02\x02\x02"~
		"\x11\u0120\x03\x02\x02\x02\x13\u0127\x03\x02\x02\x02\x15\u012a\x03\x02"~
		"\x02\x02\x17\u0131\x03\x02\x02\x02\x19\u013a\x03\x02\x02\x02\x1b\u0141"~
		"\x03\x02\x02\x02\x1d\u0144\x03\x02\x02\x02\x1f\u0149\x03\x02\x02\x02!"~
		"\u014e\x03\x02\x02\x02#\u0154\x03\x02\x02\x02%\u0158\x03\x02\x02\x02\'"~
		"\u015b\x03\x02\x02\x02)\u015f\x03\x02\x02\x02+\u0167\x03\x02\x02\x02-"~
		"\u016c\x03\x02\x02\x02/\u0173\x03\x02\x02\x021\u017a\x03\x02\x02\x023"~
		"\u017d\x03\x02\x02\x025\u0181\x03\x02\x02\x027\u0185\x03\x02\x02\x029"~
		"\u0188\x03\x02\x02\x02;\u018d\x03\x02\x02\x02=\u0192\x03\x02\x02\x02?"~
		"\u0198\x03\x02\x02\x02A\u019e\x03\x02\x02\x02C\u01a4\x03\x02\x02\x02E"~
		"\u01a8\x03\x02\x02\x02G\u01ad\x03\x02\x02\x02I\u01b6\x03\x02\x02\x02K"~
		"\u01bc\x03\x02\x02\x02M\u01c2\x03\x02\x02\x02O\u01d4\x03\x02\x02\x02Q"~
		"\u01d8\x03\x02\x02\x02S\u01e4\x03\x02\x02\x02U\u01ef\x03\x02\x02\x02W"~
		"\u0201\x03\x02\x02\x02Y\u0203\x03\x02\x02\x02[\u020a\x03\x02\x02\x02]"~
		"\u0211\x03\x02\x02\x02_\u021a\x03\x02\x02\x02a\u021e\x03\x02\x02\x02c"~
		"\u0222\x03\x02\x02\x02e\u0224\x03\x02\x02\x02g\u0228\x03\x02\x02\x02i"~
		"\u022a\x03\x02\x02\x02k\u022d\x03\x02\x02\x02m\u0230\x03\x02\x02\x02o"~
		"\u0232\x03\x02\x02\x02q\u0234\x03\x02\x02\x02s\u0236\x03\x02\x02\x02u"~
		"\u0239\x03\x02\x02\x02w\u023b\x03\x02\x02\x02y\u023e\x03\x02\x02\x02{"~
		"\u0241\x03\x02\x02\x02}\u0243\x03\x02\x02\x02\x7f\u0245\x03\x02\x02\x02"~
		"\u0081\u0247\x03\x02\x02\x02\u0083\u024a\x03\x02\x02\x02\u0085\u024d\x03"~
		"\x02\x02\x02\u0087\u024f\x03\x02\x02\x02\u0089\u0251\x03\x02\x02\x02\u008b"~
		"\u0253\x03\x02\x02\x02\u008d\u0255\x03\x02\x02\x02\u008f\u0258\x03\x02"~
		"\x02\x02\u0091\u025a\x03\x02\x02\x02\u0093\u025d\x03\x02\x02\x02\u0095"~
		"\u0260\x03\x02\x02\x02\u0097\u0262\x03\x02\x02\x02\u0099\u0264\x03\x02"~
		"\x02\x02\u009b\u0267\x03\x02\x02\x02\u009d\u026a\x03\x02\x02\x02\u009f"~
		"\u026d\x03\x02\x02\x02\u00a1\u0270\x03\x02\x02\x02\u00a3\u0273\x03\x02"~
		"\x02\x02\u00a5\u0275\x03\x02\x02\x02\u00a7\u0278\x03\x02\x02\x02\u00a9"~
		"\u027b\x03\x02\x02\x02\u00ab\u027e\x03\x02\x02\x02\u00ad\u0281\x03\x02"~
		"\x02\x02\u00af\u0284\x03\x02\x02\x02\u00b1\u0287\x03\x02\x02\x02\u00b3"~
		"\u028a\x03\x02\x02\x02\u00b5\u028d\x03\x02\x02\x02\u00b7\u0290\x03\x02"~
		"\x02\x02\u00b9\u0293\x03\x02\x02\x02\u00bb\u0297\x03\x02\x02\x02\u00bd"~
		"\u029b\x03\x02\x02\x02\u00bf\u029f\x03\x02\x02\x02\u00c1\u02a6\x03\x02"~
		"\x02\x02\u00c3\u02aa\x03\x02\x02\x02\u00c5\u02be\x03\x02\x02\x02\u00c7"~
		"\u02da\x03\x02\x02\x02\u00c9\u02de\x03\x02\x02\x02\u00cb\u02e0\x03\x02"~
		"\x02\x02\u00cd\u02e6\x03\x02\x02\x02\u00cf\u02e8\x03\x02\x02\x02\u00d1"~
		"\u02ea\x03\x02\x02\x02\u00d3\u02ec\x03\x02\x02\x02\u00d5\u02ee\x03\x02"~
		"\x02\x02\u00d7\u02f0\x03\x02\x02\x02\u00d9\u02f9\x03\x02\x02\x02\u00db"~
		"\u02fd\x03\x02\x02\x02\u00dd\u0302\x03\x02\x02\x02\u00df\u0306\x03\x02"~
		"\x02\x02\u00e1\u030c\x03\x02\x02\x02\u00e3\u0327\x03\x02\x02\x02\u00e5"~
		"\u0343\x03\x02\x02\x02\u00e7\u0347\x03\x02\x02\x02\u00e9\u034a\x03\x02"~
		"\x02\x02\u00eb\u034d\x03\x02\x02\x02\u00ed\u0350\x03\x02\x02\x02\u00ef"~
		"\u0352\x03\x02\x02\x02\u00f1\u0356\x03\x02\x02\x02\u00f3\u035a\x03\x02"~
		"\x02\x02\u00f5\u0361\x03\x02\x02\x02\u00f7\u036d\x03\x02\x02\x02\u00f9"~
		"\u0371\x03\x02\x02\x02\u00fb\u00fe\x05S*\x02\u00fc\u00fe\x05U+\x02\u00fd"~
		"\u00fb\x03\x02\x02\x02\u00fd\u00fc\x03\x02\x02\x02\u00fe\x04\x03\x02\x02"~
		"\x02\u00ff\u0103\x05\x07\x04\x02\u0100\u0103\x05_0\x02\u0101\u0103\x05"~
		"a1\x02\u0102\u00ff\x03\x02\x02\x02\u0102\u0100\x03\x02\x02\x02\u0102\u0101"~
		"\x03\x02\x02\x02\u0103\x06\x03\x02\x02\x02\u0104\u0109\x05W,\x02\u0105"~
		"\u0109\x05Y-\x02\u0106\u0109\x05[.\x02\u0107\u0109\x05]/\x02\u0108\u0104"~
		"\x03\x02\x02\x02\u0108\u0105\x03\x02\x02\x02\u0108\u0106\x03\x02\x02\x02"~
		"\u0108\u0107\x03\x02\x02\x02\u0109\b\x03\x02\x02\x02\u010a\u010b\x07f"~
		"\x02\x02\u010b\u010c\x07g\x02\x02\u010c\u010d\x07h\x02\x02\u010d\n\x03"~
		"\x02\x02\x02\u010e\u010f\x07t\x02\x02\u010f\u0110\x07g\x02\x02\u0110\u0111"~
		"\x07v\x02\x02\u0111\u0112\x07w\x02\x02\u0112\u0113\x07t\x02\x02\u0113"~
		"\u0114\x07p\x02\x02\u0114\f\x03\x02\x02\x02\u0115\u0116\x07t\x02\x02\u0116"~
		"\u0117\x07c\x02\x02\u0117\u0118\x07k\x02\x02\u0118\u0119\x07u\x02\x02"~
		"\u0119\u011a\x07g\x02\x02\u011a\x0e\x03\x02\x02\x02\u011b\u011c\x07h\x02"~
		"\x02\u011c\u011d\x07t\x02\x02\u011d\u011e\x07q\x02\x02\u011e\u011f\x07"~
		"o\x02\x02\u011f\x10\x03\x02\x02\x02\u0120\u0121\x07k\x02\x02\u0121\u0122"~
		"\x07o\x02\x02\u0122\u0123\x07r\x02\x02\u0123\u0124\x07q\x02\x02\u0124"~
		"\u0125\x07t\x02\x02\u0125\u0126\x07v\x02\x02\u0126\x12\x03\x02\x02\x02"~
		"\u0127\u0128\x07c\x02\x02\u0128\u0129\x07u\x02\x02\u0129\x14\x03\x02\x02"~
		"\x02\u012a\u012b\x07i\x02\x02\u012b\u012c\x07n\x02\x02\u012c\u012d\x07"~
		"q\x02\x02\u012d\u012e\x07d\x02\x02\u012e\u012f\x07c\x02\x02\u012f\u0130"~
		"\x07n\x02\x02\u0130\x16\x03\x02\x02\x02\u0131\u0132\x07p\x02\x02\u0132"~
		"\u0133\x07q\x02\x02\u0133\u0134\x07p\x02\x02\u0134\u0135\x07n\x02\x02"~
		"\u0135\u0136\x07q\x02\x02\u0136\u0137\x07e\x02\x02\u0137\u0138\x07c\x02"~
		"\x02\u0138\u0139\x07n\x02\x02\u0139\x18\x03\x02\x02\x02\u013a\u013b\x07"~
		"c\x02\x02\u013b\u013c\x07u\x02\x02\u013c\u013d\x07u\x02\x02\u013d\u013e"~
		"\x07g\x02\x02\u013e\u013f\x07t\x02\x02\u013f\u0140\x07v\x02\x02\u0140"~
		"\x1a\x03\x02\x02\x02\u0141\u0142\x07k\x02\x02\u0142\u0143\x07h\x02\x02"~
		"\u0143\x1c\x03\x02\x02\x02\u0144\u0145\x07g\x02\x02\u0145\u0146\x07n\x02"~
		"\x02\u0146\u0147\x07k\x02\x02\u0147\u0148\x07h\x02\x02\u0148\x1e\x03\x02"~
		"\x02\x02\u0149\u014a\x07g\x02\x02\u014a\u014b\x07n\x02\x02\u014b\u014c"~
		"\x07u\x02\x02\u014c\u014d\x07g\x02\x02\u014d \x03\x02\x02\x02\u014e\u014f"~
		"\x07y\x02\x02\u014f\u0150\x07j\x02\x02\u0150\u0151\x07k\x02\x02\u0151"~
		"\u0152\x07n\x02\x02\u0152\u0153\x07g\x02\x02\u0153\"\x03\x02\x02\x02\u0154"~
		"\u0155\x07h\x02\x02\u0155\u0156\x07q\x02\x02\u0156\u0157\x07t\x02\x02"~
		"\u0157$\x03\x02\x02\x02\u0158\u0159\x07k\x02\x02\u0159\u015a\x07p\x02"~
		"\x02\u015a&\x03\x02\x02\x02\u015b\u015c\x07v\x02\x02\u015c\u015d\x07t"~
		"\x02\x02\u015d\u015e\x07{\x02\x02\u015e(\x03\x02\x02\x02\u015f\u0160\x07"~
		"h\x02\x02\u0160\u0161\x07k\x02\x02\u0161\u0162\x07p\x02\x02\u0162\u0163"~
		"\x07c\x02\x02\u0163\u0164\x07n\x02\x02\u0164\u0165\x07n\x02\x02\u0165"~
		"\u0166\x07{\x02\x02\u0166*\x03\x02\x02\x02\u0167\u0168\x07y\x02\x02\u0168"~
		"\u0169\x07k\x02\x02\u0169\u016a\x07v\x02\x02\u016a\u016b\x07j\x02\x02"~
		"\u016b,\x03\x02\x02\x02\u016c\u016d\x07g\x02\x02\u016d\u016e\x07z\x02"~
		"\x02\u016e\u016f\x07e\x02\x02\u016f\u0170\x07g\x02\x02\u0170\u0171\x07"~
		"r\x02\x02\u0171\u0172\x07v\x02\x02\u0172.\x03\x02\x02\x02\u0173\u0174"~
		"\x07n\x02\x02\u0174\u0175\x07c\x02\x02\u0175\u0176\x07o\x02\x02\u0176"~
		"\u0177\x07d\x02\x02\u0177\u0178\x07f\x02\x02\u0178\u0179\x07c\x02\x02"~
		"\u01790\x03\x02\x02\x02\u017a\u017b\x07q\x02\x02\u017b\u017c\x07t\x02"~
		"\x02\u017c2\x03\x02\x02\x02\u017d\u017e\x07c\x02\x02\u017e\u017f\x07p"~
		"\x02\x02\u017f\u0180\x07f\x02\x02\u01804\x03\x02\x02\x02\u0181\u0182\x07"~
		"p\x02\x02\u0182\u0183\x07q\x02\x02\u0183\u0184\x07v\x02\x02\u01846\x03"~
		"\x02\x02\x02\u0185\u0186\x07k\x02\x02\u0186\u0187\x07u\x02\x02\u01878"~
		"\x03\x02\x02\x02\u0188\u0189\x07P\x02\x02\u0189\u018a\x07q\x02\x02\u018a"~
		"\u018b\x07p\x02\x02\u018b\u018c\x07g\x02\x02\u018c:\x03\x02\x02\x02\u018d"~
		"\u018e\x07V\x02\x02\u018e\u018f\x07t\x02\x02\u018f\u0190\x07w\x02\x02"~
		"\u0190\u0191\x07g\x02\x02\u0191<\x03\x02\x02\x02\u0192\u0193\x07H\x02"~
		"\x02\u0193\u0194\x07c\x02\x02\u0194\u0195\x07n\x02\x02\u0195\u0196\x07"~
		"u\x02\x02\u0196\u0197\x07g\x02\x02\u0197>\x03\x02\x02\x02\u0198\u0199"~
		"\x07e\x02\x02\u0199\u019a\x07n\x02\x02\u019a\u019b\x07c\x02\x02\u019b"~
		"\u019c\x07u\x02\x02\u019c\u019d\x07u\x02\x02\u019d@\x03\x02\x02\x02\u019e"~
		"\u019f\x07{\x02\x02\u019f\u01a0\x07k\x02\x02\u01a0\u01a1\x07g\x02\x02"~
		"\u01a1\u01a2\x07n\x02\x02\u01a2\u01a3\x07f\x02\x02\u01a3B\x03\x02\x02"~
		"\x02\u01a4\u01a5\x07f\x02\x02\u01a5\u01a6\x07g\x02\x02\u01a6\u01a7\x07"~
		"n\x02\x02\u01a7D\x03\x02\x02\x02\u01a8\u01a9\x07r\x02\x02\u01a9\u01aa"~
		"\x07c\x02\x02\u01aa\u01ab\x07u\x02\x02\u01ab\u01ac\x07u\x02\x02\u01ac"~
		"F\x03\x02\x02\x02\u01ad\u01ae\x07e\x02\x02\u01ae\u01af\x07q\x02\x02\u01af"~
		"\u01b0\x07p\x02\x02\u01b0\u01b1\x07v\x02\x02\u01b1\u01b2\x07k\x02\x02"~
		"\u01b2\u01b3\x07p\x02\x02\u01b3\u01b4\x07w\x02\x02\u01b4\u01b5\x07g\x02"~
		"\x02\u01b5H\x03\x02\x02\x02\u01b6\u01b7\x07d\x02\x02\u01b7\u01b8\x07t"~
		"\x02\x02\u01b8\u01b9\x07g\x02\x02\u01b9\u01ba\x07c\x02\x02\u01ba\u01bb"~
		"\x07m\x02\x02\u01bbJ\x03\x02\x02\x02\u01bc\u01bd\x07c\x02\x02\u01bd\u01be"~
		"\x07u\x02\x02\u01be\u01bf\x07{\x02\x02\u01bf\u01c0\x07p\x02\x02\u01c0"~
		"\u01c1\x07e\x02\x02\u01c1L\x03\x02\x02\x02\u01c2\u01c3\x07c\x02\x02\u01c3"~
		"\u01c4\x07y\x02\x02\u01c4\u01c5\x07c\x02\x02\u01c5\u01c6\x07k\x02\x02"~
		"\u01c6\u01c7\x07v\x02\x02\u01c7N\x03\x02\x02\x02\u01c8\u01c9\x06(\x02"~
		"\x02\u01c9\u01d5\x05\u00f1y\x02\u01ca\u01cc\x07\x0f\x02\x02\u01cb\u01ca"~
		"\x03\x02\x02\x02\u01cb\u01cc\x03\x02\x02\x02\u01cc\u01cd\x03\x02\x02\x02"~
		"\u01cd\u01d0\x07\f\x02\x02\u01ce\u01d0\x04\x0e\x0f\x02\u01cf\u01cb\x03"~
		"\x02\x02\x02\u01cf\u01ce\x03\x02\x02\x02\u01d0\u01d2\x03\x02\x02\x02\u01d1"~
		"\u01d3\x05\u00f1y\x02\u01d2\u01d1\x03\x02\x02\x02\u01d2\u01d3\x03\x02"~
		"\x02\x02\u01d3\u01d5\x03\x02\x02\x02\u01d4\u01c8\x03\x02\x02\x02\u01d4"~
		"\u01cf\x03\x02\x02\x02\u01d5\u01d6\x03\x02\x02\x02\u01d6\u01d7\b(\x02"~
		"\x02\u01d7P\x03\x02\x02\x02\u01d8\u01dc\x05\u00f7|\x02\u01d9\u01db\x05"~
		"\u00f9}\x02\u01da\u01d9\x03\x02\x02\x02\u01db\u01de\x03\x02\x02\x02\u01dc"~
		"\u01da\x03\x02\x02\x02\u01dc\u01dd\x03\x02\x02\x02\u01ddR\x03\x02\x02"~
		"\x02\u01de\u01dc\x03\x02\x02\x02\u01df\u01e5\t\x02\x02\x02\u01e0\u01e1"~
		"\t\x03\x02\x02\u01e1\u01e5\t\x04\x02\x02\u01e2\u01e3\t\x04\x02\x02\u01e3"~
		"\u01e5\t\x03\x02\x02\u01e4\u01df\x03\x02\x02\x02\u01e4\u01e0\x03\x02\x02"~
		"\x02\u01e4\u01e2\x03\x02\x02\x02\u01e4\u01e5\x03\x02\x02\x02\u01e5\u01e8"~
		"\x03\x02\x02\x02\u01e6\u01e9\x05\u00c5c\x02\u01e7\u01e9\x05\u00c7d\x02"~
		"\u01e8\u01e6\x03\x02\x02\x02\u01e8\u01e7\x03\x02\x02\x02\u01e9T\x03\x02"~
		"\x02\x02\u01ea\u01f0\t\x05\x02\x02\u01eb\u01ec\t\x05\x02\x02\u01ec\u01f0"~
		"\t\x04\x02\x02\u01ed\u01ee\t\x04\x02\x02\u01ee\u01f0\t\x05\x02\x02\u01ef"~
		"\u01ea\x03\x02\x02\x02\u01ef\u01eb\x03\x02\x02\x02\u01ef\u01ed\x03\x02"~
		"\x02\x02\u01f0\u01f3\x03\x02\x02\x02\u01f1\u01f4\x05\u00e3r\x02\u01f2"~
		"\u01f4\x05\u00e5s\x02\u01f3\u01f1\x03\x02\x02\x02\u01f3\u01f2\x03\x02"~
		"\x02\x02\u01f4V\x03\x02\x02\x02\u01f5\u01f9\x05\u00cfh\x02\u01f6\u01f8"~
		"\x05\u00d1i\x02\u01f7\u01f6\x03\x02\x02\x02\u01f8\u01fb\x03\x02\x02\x02"~
		"\u01f9\u01f7\x03\x02\x02\x02\u01f9\u01fa\x03\x02\x02\x02\u01fa\u0202\x03"~
		"\x02\x02\x02\u01fb\u01f9\x03\x02\x02\x02\u01fc\u01fe\x072\x02\x02\u01fd"~
		"\u01fc\x03\x02\x02\x02\u01fe\u01ff\x03\x02\x02\x02\u01ff\u01fd\x03\x02"~
		"\x02\x02\u01ff\u0200\x03\x02\x02\x02\u0200\u0202\x03\x02\x02\x02\u0201"~
		"\u01f5\x03\x02\x02\x02\u0201\u01fd\x03\x02\x02\x02\u0202X\x03\x02\x02"~
		"\x02\u0203\u0204\x072\x02\x02\u0204\u0206\t\x06\x02\x02\u0205\u0207\x05"~
		"\u00d3j\x02\u0206\u0205\x03\x02\x02\x02\u0207\u0208\x03\x02\x02\x02\u0208"~
		"\u0206\x03\x02\x02\x02\u0208\u0209\x03\x02\x02\x02\u0209Z\x03\x02\x02"~
		"\x02\u020a\u020b\x072\x02\x02\u020b\u020d\t\x07\x02\x02\u020c\u020e\x05"~
		"\u00d5k\x02\u020d\u020c\x03\x02\x02\x02\u020e\u020f\x03\x02\x02\x02\u020f"~
		"\u020d\x03\x02\x02\x02\u020f\u0210\x03\x02\x02\x02\u0210\\\x03\x02\x02"~
		"\x02\u0211\u0212\x072\x02\x02\u0212\u0214\t\x05\x02\x02\u0213\u0215\x05"~
		"\u00d7l\x02\u0214\u0213\x03\x02\x02\x02\u0215\u0216\x03\x02\x02\x02\u0216"~
		"\u0214\x03\x02\x02\x02\u0216\u0217\x03\x02\x02\x02\u0217^\x03\x02\x02"~
		"\x02\u0218\u021b\x05\u00d9m\x02\u0219\u021b\x05\u00dbn\x02\u021a\u0218"~
		"\x03\x02\x02\x02\u021a\u0219\x03\x02\x02\x02\u021b`\x03\x02\x02\x02\u021c"~
		"\u021f\x05_0\x02\u021d\u021f\x05\u00ddo\x02\u021e\u021c\x03\x02\x02\x02"~
		"\u021e\u021d\x03\x02\x02\x02\u021f\u0220\x03\x02\x02\x02\u0220\u0221\t"~
		"\b\x02\x02\u0221b\x03\x02\x02\x02\u0222\u0223\x070\x02\x02\u0223d\x03"~
		"\x02\x02\x02\u0224\u0225\x070\x02\x02\u0225\u0226\x070\x02\x02\u0226\u0227"~
		"\x070\x02\x02\u0227f\x03\x02\x02\x02\u0228\u0229\x07,\x02\x02\u0229h\x03"~
		"\x02\x02\x02\u022a\u022b\x07*\x02\x02\u022b\u022c\b5\x03\x02\u022cj\x03"~
		"\x02\x02\x02\u022d\u022e\x07+\x02\x02\u022e\u022f\b6\x04\x02\u022fl\x03"~
		"\x02\x02\x02\u0230\u0231\x07.\x02\x02\u0231n\x03\x02\x02\x02\u0232\u0233"~
		"\x07<\x02\x02\u0233p\x03\x02\x02\x02\u0234\u0235\x07=\x02\x02\u0235r\x03"~
		"\x02\x02\x02\u0236\u0237\x07,\x02\x02\u0237\u0238\x07,\x02\x02\u0238t"~
		"\x03\x02\x02\x02\u0239\u023a\x07?\x02\x02\u023av\x03\x02\x02\x02\u023b"~
		"\u023c\x07]\x02\x02\u023c\u023d\b<\x05\x02\u023dx\x03\x02\x02\x02\u023e"~
		"\u023f\x07_\x02\x02\u023f\u0240\b=\x06\x02\u0240z\x03\x02\x02\x02\u0241"~
		"\u0242\x07~\x02\x02\u0242|\x03\x02\x02\x02\u0243\u0244\x07`\x02\x02\u0244"~
		"~\x03\x02\x02\x02\u0245\u0246\x07(\x02\x02\u0246\u0080\x03\x02\x02\x02"~
		"\u0247\u0248\x07>\x02\x02\u0248\u0249\x07>\x02\x02\u0249\u0082\x03\x02"~
		"\x02\x02\u024a\u024b\x07@\x02\x02\u024b\u024c\x07@\x02\x02\u024c\u0084"~
		"\x03\x02\x02\x02\u024d\u024e\x07-\x02\x02\u024e\u0086\x03\x02\x02\x02"~
		"\u024f\u0250\x07/\x02\x02\u0250\u0088\x03\x02\x02\x02\u0251\u0252\x07"~
		"1\x02\x02\u0252\u008a\x03\x02\x02\x02\u0253\u0254\x07\'\x02\x02\u0254"~
		"\u008c\x03\x02\x02\x02\u0255\u0256\x071\x02\x02\u0256\u0257\x071\x02\x02"~
		"\u0257\u008e\x03\x02\x02\x02\u0258\u0259\x07\u0080\x02\x02\u0259\u0090"~
		"\x03\x02\x02\x02\u025a\u025b\x07}\x02\x02\u025b\u025c\bI\x07\x02\u025c"~
		"\u0092\x03\x02\x02\x02\u025d\u025e\x07\x7f\x02\x02\u025e\u025f\bJ\b\x02"~
		"\u025f\u0094\x03\x02\x02\x02\u0260\u0261\x07>\x02\x02\u0261\u0096\x03"~
		"\x02\x02\x02\u0262\u0263\x07@\x02\x02\u0263\u0098\x03\x02\x02\x02\u0264"~
		"\u0265\x07?\x02\x02\u0265\u0266\x07?\x02\x02\u0266\u009a\x03\x02\x02\x02"~
		"\u0267\u0268\x07@\x02\x02\u0268\u0269\x07?\x02\x02\u0269\u009c\x03\x02"~
		"\x02\x02\u026a\u026b\x07>\x02\x02\u026b\u026c\x07?\x02\x02\u026c\u009e"~
		"\x03\x02\x02\x02\u026d\u026e\x07>\x02\x02\u026e\u026f\x07@\x02\x02\u026f"~
		"\u00a0\x03\x02\x02\x02\u0270\u0271\x07#\x02\x02\u0271\u0272\x07?\x02\x02"~
		"\u0272\u00a2\x03\x02\x02\x02\u0273\u0274\x07B\x02\x02\u0274\u00a4\x03"~
		"\x02\x02\x02\u0275\u0276\x07/\x02\x02\u0276\u0277\x07@\x02\x02\u0277\u00a6"~
		"\x03\x02\x02\x02\u0278\u0279\x07-\x02\x02\u0279\u027a\x07?\x02\x02\u027a"~
		"\u00a8\x03\x02\x02\x02\u027b\u027c\x07/\x02\x02\u027c\u027d\x07?\x02\x02"~
		"\u027d\u00aa\x03\x02\x02\x02\u027e\u027f\x07,\x02\x02\u027f\u0280\x07"~
		"?\x02\x02\u0280\u00ac\x03\x02\x02\x02\u0281\u0282\x07B\x02\x02\u0282\u0283"~
		"\x07?\x02\x02\u0283\u00ae\x03\x02\x02\x02\u0284\u0285\x071\x02\x02\u0285"~
		"\u0286\x07?\x02\x02\u0286\u00b0\x03\x02\x02\x02\u0287\u0288\x07\'\x02"~
		"\x02\u0288\u0289\x07?\x02\x02\u0289\u00b2\x03\x02\x02\x02\u028a\u028b"~
		"\x07(\x02\x02\u028b\u028c\x07?\x02\x02\u028c\u00b4\x03\x02\x02\x02\u028d"~
		"\u028e\x07~\x02\x02\u028e\u028f\x07?\x02\x02\u028f\u00b6\x03\x02\x02\x02"~
		"\u0290\u0291\x07`\x02\x02\u0291\u0292\x07?\x02\x02\u0292\u00b8\x03\x02"~
		"\x02\x02\u0293\u0294\x07>\x02\x02\u0294\u0295\x07>\x02\x02\u0295\u0296"~
		"\x07?\x02\x02\u0296\u00ba\x03\x02\x02\x02\u0297\u0298\x07@\x02\x02\u0298"~
		"\u0299\x07@\x02\x02\u0299\u029a\x07?\x02\x02\u029a\u00bc\x03\x02\x02\x02"~
		"\u029b\u029c\x07,\x02\x02\u029c\u029d\x07,\x02\x02\u029d\u029e\x07?\x02"~
		"\x02\u029e\u00be\x03\x02\x02\x02\u029f\u02a0\x071\x02\x02\u02a0\u02a1"~
		"\x071\x02\x02\u02a1\u02a2\x07?\x02\x02\u02a2\u00c0\x03\x02\x02\x02\u02a3"~
		"\u02a7\x05\u00f1y\x02\u02a4\u02a7\x05\u00f3z\x02\u02a5\u02a7\x05\u00f5"~
		"{\x02\u02a6\u02a3\x03\x02\x02\x02\u02a6\u02a4\x03\x02\x02\x02\u02a6\u02a5"~
		"\x03\x02\x02\x02\u02a7\u02a8\x03\x02\x02\x02\u02a8\u02a9\ba\t\x02\u02a9"~
		"\u00c2\x03\x02\x02\x02\u02aa\u02ab\x0b\x02\x02\x02\u02ab\u00c4\x03\x02"~
		"\x02\x02\u02ac\u02b1\x07)\x02\x02\u02ad\u02b0\x05\u00cdg\x02\u02ae\u02b0"~
		"\n\t\x02\x02\u02af\u02ad\x03\x02\x02\x02\u02af\u02ae\x03\x02\x02\x02\u02b0"~
		"\u02b3\x03\x02\x02\x02\u02b1\u02af\x03\x02\x02\x02\u02b1\u02b2\x03\x02"~
		"\x02\x02\u02b2\u02b4\x03\x02\x02\x02\u02b3\u02b1\x03\x02\x02\x02\u02b4"~
		"\u02bf\x07)\x02\x02\u02b5\u02ba\x07$\x02\x02\u02b6\u02b9\x05\u00cdg\x02"~
		"\u02b7\u02b9\n\n\x02\x02\u02b8\u02b6\x03\x02\x02\x02\u02b8\u02b7\x03\x02"~
		"\x02\x02\u02b9\u02bc\x03\x02\x02\x02\u02ba\u02b8\x03\x02\x02\x02\u02ba"~
		"\u02bb\x03\x02\x02\x02\u02bb\u02bd\x03\x02\x02\x02\u02bc\u02ba\x03\x02"~
		"\x02\x02\u02bd\u02bf\x07$\x02\x02\u02be\u02ac\x03\x02\x02\x02\u02be\u02b5"~
		"\x03\x02\x02\x02\u02bf\u00c6\x03\x02\x02\x02\u02c0\u02c1\x07)\x02\x02"~
		"\u02c1\u02c2\x07)\x02\x02\u02c2\u02c3\x07)\x02\x02\u02c3\u02c7\x03\x02"~
		"\x02\x02\u02c4\u02c6\x05\u00c9e\x02\u02c5\u02c4\x03\x02\x02\x02\u02c6"~
		"\u02c9\x03\x02\x02\x02\u02c7\u02c8\x03\x02\x02\x02\u02c7\u02c5\x03\x02"~
		"\x02\x02\u02c8\u02ca\x03\x02\x02\x02\u02c9\u02c7\x03\x02\x02\x02\u02ca"~
		"\u02cb\x07)\x02\x02\u02cb\u02cc\x07)\x02\x02\u02cc\u02db\x07)\x02\x02"~
		"\u02cd\u02ce\x07$\x02\x02\u02ce\u02cf\x07$\x02\x02\u02cf\u02d0\x07$\x02"~
		"\x02\u02d0\u02d4\x03\x02\x02\x02\u02d1\u02d3\x05\u00c9e\x02\u02d2\u02d1"~
		"\x03\x02\x02\x02\u02d3\u02d6\x03\x02\x02\x02\u02d4\u02d5\x03\x02\x02\x02"~
		"\u02d4\u02d2\x03\x02\x02\x02\u02d5\u02d7\x03\x02\x02\x02\u02d6\u02d4\x03"~
		"\x02\x02\x02\u02d7\u02d8\x07$\x02\x02\u02d8\u02d9\x07$\x02\x02\u02d9\u02db"~
		"\x07$\x02\x02\u02da\u02c0\x03\x02\x02\x02\u02da\u02cd\x03\x02\x02\x02"~
		"\u02db\u00c8\x03\x02\x02\x02\u02dc\u02df\x05\u00cbf\x02\u02dd\u02df\x05"~
		"\u00cdg\x02\u02de\u02dc\x03\x02\x02\x02\u02de\u02dd\x03\x02\x02\x02\u02df"~
		"\u00ca\x03\x02\x02\x02\u02e0\u02e1\n\x0b\x02\x02\u02e1\u00cc\x03\x02\x02"~
		"\x02\u02e2\u02e3\x07^\x02\x02\u02e3\u02e7\x0b\x02\x02\x02\u02e4\u02e5"~
		"\x07^\x02\x02\u02e5\u02e7\x05O(\x02\u02e6\u02e2\x03\x02\x02\x02\u02e6"~
		"\u02e4\x03\x02\x02\x02\u02e7\u00ce\x03\x02\x02\x02\u02e8\u02e9\t\f\x02"~
		"\x02\u02e9\u00d0\x03\x02\x02\x02\u02ea\u02eb\t\r\x02\x02\u02eb\u00d2\x03"~
		"\x02\x02\x02\u02ec\u02ed\t\x0e\x02\x02\u02ed\u00d4\x03\x02\x02\x02\u02ee"~
		"\u02ef\t\x0f\x02\x02\u02ef\u00d6\x03\x02\x02\x02\u02f0\u02f1\t\x10\x02"~
		"\x02\u02f1\u00d8\x03\x02\x02\x02\u02f2\u02f4\x05\u00ddo\x02\u02f3\u02f2"~
		"\x03\x02\x02\x02\u02f3\u02f4\x03\x02\x02\x02\u02f4\u02f5\x03\x02\x02\x02"~
		"\u02f5\u02fa\x05\u00dfp\x02\u02f6\u02f7\x05\u00ddo\x02\u02f7\u02f8\x07"~
		"0\x02\x02\u02f8\u02fa\x03\x02\x02\x02\u02f9\u02f3\x03\x02\x02\x02\u02f9"~
		"\u02f6\x03\x02\x02\x02\u02fa\u00da\x03\x02\x02\x02\u02fb\u02fe\x05\u00dd"~
		"o\x02\u02fc\u02fe\x05\u00d9m\x02\u02fd\u02fb\x03\x02\x02\x02\u02fd\u02fc"~
		"\x03\x02\x02\x02\u02fe\u02ff\x03\x02\x02\x02\u02ff\u0300\x05\u00e1q\x02"~
		"\u0300\u00dc\x03\x02\x02\x02\u0301\u0303\x05\u00d1i\x02\u0302\u0301\x03"~
		"\x02\x02\x02\u0303\u0304\x03\x02\x02\x02\u0304\u0302\x03\x02\x02\x02\u0304"~
		"\u0305\x03\x02\x02\x02\u0305\u00de\x03\x02\x02\x02\u0306\u0308\x070\x02"~
		"\x02\u0307\u0309\x05\u00d1i\x02\u0308\u0307\x03\x02\x02\x02\u0309\u030a"~
		"\x03\x02\x02\x02\u030a\u0308\x03\x02\x02\x02\u030a\u030b\x03\x02\x02\x02"~
		"\u030b\u00e0\x03\x02\x02\x02\u030c\u030e\t\x11\x02\x02\u030d\u030f\t\x12"~
		"\x02\x02\u030e\u030d\x03\x02\x02\x02\u030e\u030f\x03\x02\x02\x02\u030f"~
		"\u0311\x03\x02\x02\x02\u0310\u0312\x05\u00d1i\x02\u0311\u0310\x03\x02"~
		"\x02\x02\u0312\u0313\x03\x02\x02\x02\u0313\u0311\x03\x02\x02\x02\u0313"~
		"\u0314\x03\x02\x02\x02\u0314\u00e2\x03\x02\x02\x02\u0315\u031a\x07)\x02"~
		"\x02\u0316\u0319\x05\u00e9u\x02\u0317\u0319\x05\u00efx\x02\u0318\u0316"~
		"\x03\x02\x02\x02\u0318\u0317\x03\x02\x02\x02\u0319\u031c\x03\x02\x02\x02"~
		"\u031a\u0318\x03\x02\x02\x02\u031a\u031b\x03\x02\x02\x02\u031b\u031d\x03"~
		"\x02\x02\x02\u031c\u031a\x03\x02\x02\x02\u031d\u0328\x07)\x02\x02\u031e"~
		"\u0323\x07$\x02\x02\u031f\u0322\x05\u00ebv\x02\u0320\u0322\x05\u00efx"~
		"\x02\u0321\u031f\x03\x02\x02\x02\u0321\u0320\x03\x02\x02\x02\u0322\u0325"~
		"\x03\x02\x02\x02\u0323\u0321\x03\x02\x02\x02\u0323\u0324\x03\x02\x02\x02"~
		"\u0324\u0326\x03\x02\x02\x02\u0325\u0323\x03\x02\x02\x02\u0326\u0328\x07"~
		"$\x02\x02\u0327\u0315\x03\x02\x02\x02\u0327\u031e\x03\x02\x02\x02\u0328"~
		"\u00e4\x03\x02\x02\x02\u0329\u032a\x07)\x02\x02\u032a\u032b\x07)\x02\x02"~
		"\u032b\u032c\x07)\x02\x02\u032c\u0330\x03\x02\x02\x02\u032d\u032f\x05"~
		"\u00e7t\x02\u032e\u032d\x03\x02\x02\x02\u032f\u0332\x03\x02\x02\x02\u0330"~
		"\u0331\x03\x02\x02\x02\u0330\u032e\x03\x02\x02\x02\u0331\u0333\x03\x02"~
		"\x02\x02\u0332\u0330\x03\x02\x02\x02\u0333\u0334\x07)\x02\x02\u0334\u0335"~
		"\x07)\x02\x02\u0335\u0344\x07)\x02\x02\u0336\u0337\x07$\x02\x02\u0337"~
		"\u0338\x07$\x02\x02\u0338\u0339\x07$\x02\x02\u0339\u033d\x03\x02\x02\x02"~
		"\u033a\u033c\x05\u00e7t\x02\u033b\u033a\x03\x02\x02\x02\u033c\u033f\x03"~
		"\x02\x02\x02\u033d\u033e\x03\x02\x02\x02\u033d\u033b\x03\x02\x02\x02\u033e"~
		"\u0340\x03\x02\x02\x02\u033f\u033d\x03\x02\x02\x02\u0340\u0341\x07$\x02"~
		"\x02\u0341\u0342\x07$\x02\x02\u0342\u0344\x07$\x02\x02\u0343\u0329\x03"~
		"\x02\x02\x02\u0343\u0336\x03\x02\x02\x02\u0344\u00e6\x03\x02\x02\x02\u0345"~
		"\u0348\x05\u00edw\x02\u0346\u0348\x05\u00efx\x02\u0347\u0345\x03\x02\x02"~
		"\x02\u0347\u0346\x03\x02\x02\x02\u0348\u00e8\x03\x02\x02\x02\u0349\u034b"~
		"\t\x13\x02\x02\u034a\u0349\x03\x02\x02\x02\u034b\u00ea\x03\x02\x02\x02"~
		"\u034c\u034e\t\x14\x02\x02\u034d\u034c\x03\x02\x02\x02\u034e\u00ec\x03"~
		"\x02\x02\x02\u034f\u0351\t\x15\x02\x02\u0350\u034f\x03\x02\x02\x02\u0351"~
		"\u00ee\x03\x02\x02\x02\u0352\u0353\x07^\x02\x02\u0353\u0354\t\x16\x02"~
		"\x02\u0354\u00f0\x03\x02\x02\x02\u0355\u0357\t\x17\x02\x02\u0356\u0355"~
		"\x03\x02\x02\x02\u0357\u0358\x03\x02\x02\x02\u0358\u0356\x03\x02\x02\x02"~
		"\u0358\u0359\x03\x02\x02\x02\u0359\u00f2\x03\x02\x02\x02\u035a\u035e\x07"~
		"%\x02\x02\u035b\u035d\n\x18\x02\x02\u035c\u035b\x03\x02\x02\x02\u035d"~
		"\u0360\x03\x02\x02\x02\u035e\u035c\x03\x02\x02\x02\u035e\u035f\x03\x02"~
		"\x02\x02\u035f\u00f4\x03\x02\x02\x02\u0360\u035e\x03\x02\x02\x02\u0361"~
		"\u0363\x07^\x02\x02\u0362\u0364\x05\u00f1y\x02\u0363\u0362\x03\x02\x02"~
		"\x02\u0363\u0364\x03\x02\x02\x02\u0364\u036a\x03\x02\x02\x02\u0365\u0367"~
		"\x07\x0f\x02\x02\u0366\u0365\x03\x02\x02\x02\u0366\u0367\x03\x02\x02\x02"~
		"\u0367\u0368\x03\x02\x02\x02\u0368\u036b\x07\f\x02\x02\u0369\u036b\x04"~
		"\x0e\x0f\x02\u036a\u0366\x03\x02\x02\x02\u036a\u0369\x03\x02\x02\x02\u036b"~
		"\u00f6\x03\x02\x02\x02\u036c\u036e\t\x19\x02\x02\u036d\u036c\x03\x02\x02"~
		"\x02\u036e\u00f8\x03\x02\x02\x02\u036f\u0372\x05\u00f7|\x02\u0370\u0372"~
		"\t\x1a\x02\x02\u0371\u036f\x03\x02\x02\x02\u0371\u0370\x03\x02\x02\x02"~
		"\u0372\u00fa\x03\x02\x02\x02<\x02\u00fd\u0102\u0108\u01cb\u01cf\u01d2"~
		"\u01d4\u01dc\u01e4\u01e8\u01ef\u01f3\u01f9\u01ff\u0201\u0208\u020f\u0216"~
		"\u021a\u021e\u02a6\u02af\u02b1\u02b8\u02ba\u02be\u02c7\u02d4\u02da\u02de"~
		"\u02e6\u02f3\u02f9\u02fd\u0304\u030a\u030e\u0313\u0318\u031a\u0321\u0323"~
		"\u0327\u0330\u033d\u0343\u0347\u034a\u034d\u0350\u0358\u035e\u0363\u0366"~
		"\u036a\u036d\u0371\n\x03(\x02\x035\x03\x036\x04\x03<\x05\x03=\x06\x03"~
		"I\x07\x03J\b\b\x02\x02";
	public static ATN _ATN;

	static this() {
	    auto atnDeserializer = new ATNDeserializer;
	    _ATN = atnDeserializer.deserialize(_serializedATN);
	    _decisionToDFA.length = 0;
	    for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
	        _decisionToDFA ~= new DFA(_ATN.getDecisionState(i), i);
	    }
	}
}