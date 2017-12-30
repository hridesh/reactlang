// Define a signal var1. Think of var1 as a cell in a spreadsheet.
(define var1 
		(signal 1) // The initial value is 1.
)
//Define another signal var2. Think of var2 as another cell in a spreadsheet.
(define var2 
		(signal 2) // The initial value is 2.
)
//Define another signal var3. Think of var3 as another cell in a spreadsheet.
(define var3 
		(signal 
				(+ (read var1) (read var2)) //Value of var3 is var1 + var2
		)
)

(let 
		((dummy (write var1 5)))  //First, we write to var1
		(read var3)               //Then, we read updated value of var3.
)