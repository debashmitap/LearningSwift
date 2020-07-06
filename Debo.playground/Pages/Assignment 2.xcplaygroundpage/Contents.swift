//: [Previous](@previous)

/*
 Assignment 2: Calculator
 
 Let's implement a simple calculator.
 It'll be a struct with some functions you can call later, like this: Calculator().add( ...
 
 Tip: Try command-clicking the Calculator declaration to view its documentation.
 */


/// A simple calculator.
///
/// This calculator should include the following functions:
/// - `add`: receives two Ints and returns their sum.
/// - `sub`: receives two Ints and returns their difference.
/// - `mul`: receives two Ints and returns their product.
/// - `div`: receives two Ints and returns their rounded down quotient.
/// - `pow`: receives two Ints and returns the first to the power of the second.
struct Calculator {
    func add (a:Int, b:Int)->Int
    {
        return (a+b)
    }
    func sub (a:Int, b:Int)->Int
    {
        return (a-b)
    }
    func mul (a:Int, b:Int)->Int
    {
        return (a*b)
    }
    func div (a:Int, b:Int)->Int
    {
        return (a/b)
    }
    func pow (a:Int, b:Int)->Int
    {
        var j=a
        for _ in 1..<b
        {
            j=a*j
        }
        return (j)
    }
}

/*
 Write at least one call to each function to perform simple tests of your Calculator.
 */

Calculator().add(a: 5, b: 6)
Calculator().sub(a: 5, b: 6)
Calculator().mul(a: 5, b: 6)
Calculator().div(a: 5, b: 6)
Calculator().pow(a: 2, b: 3)

/*
 Now, change the Calculator struct so all of its functions accept and return Double instead of Int (except for the second argument of `pow`).
 What changed in the results above?
 */
struct DoubleCalculator {
    func add (a:Double, b:Double)->Double
    {
        return (a+b)
    }
    func sub (a:Double, b:Double)->Double
    {
        return (a-b)
    }
    func mul (a:Double, b:Double)->Double
    {
        return (a*b)
    }
    func div (a:Double, b:Double)->Double
    {
        return (a/b)
    }
    func pow (a:Double, b:Int)->Double
    {
        var j=a
        for _ in 1..<b
        {
            j=a*j
        }
        return (j)
    }
}


DoubleCalculator().add(a: 5.1, b: 6.2)
DoubleCalculator().sub(a: 5.3, b: 6.6)
DoubleCalculator().mul(a: 5.7, b: 6.1)
DoubleCalculator().div(a: 54.3, b: 6.1)
DoubleCalculator().pow(a: 2.6, b: 3)

//: [Next](@next)
