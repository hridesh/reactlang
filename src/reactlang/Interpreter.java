package reactlang;
import java.io.IOException;

import reactlang.Env;
import reactlang.Value;
import reactlang.AST.Program;

/**
 * This main class implements the Read-Eval-Print-Loop of the interpreter with
 * the help of Reader, Evaluator, and Printer classes. 
 * 
 * @author hridesh
 *
 */
public class Interpreter {
	public static void main(String[] args) {
		System.out.println("ReactLang: Type a program to evaluate and press the enter key,\n" + 
				"e.g. (define var1 (signal 1))  which creates a signal\n" + 
				"     (define var2 (signal 2))  which creates another signal\n" + 
                "     (define var3 (signal (+ (read var1) (read var2)))) \n" + 
                "     (let ((dummy (write var1 5))) (read var3)) which changes signal var1, and thus var3 (indirectly).\n" + 
				"Press Ctrl + C to exit.");
		Reader reader = new Reader();
		Evaluator eval = new Evaluator(reader);
		Printer printer = new Printer();
		REPL: while (true) { // Read-Eval-Print-Loop (also known as REPL)
			Program p = null;
			try {
				p = reader.read();
				if(p._e == null) continue REPL;
				Value val = eval.valueOf(p);
				printer.print(val);
			} catch (Env.LookupException e) {
				printer.print(e);
			} catch (IOException e) {
				System.out.println("Error reading input:" + e.getMessage());
			} catch (NullPointerException e) {
				System.out.println("Error:" + e.getMessage());
			}
		}
	}
}
