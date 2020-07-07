//: [Previous](@previous)

import Foundation

/*
 Assignment 3: Introduction to Optionals
 
 In Swift, not every variable can hold a nil value.
 In fact, the standard types in Swift can never be nil.
 If you want a variable to occasionally be nil, it should be of an *Optional* type.
 This assignment will introduce you to Optionals in Swift.
  */

/*
 Optional types are marked with a question mark.
 */
var potentiallyNilValue: Int? = nil

/*
 The variable above can hold an Int value, but can also hold nil.
 */
potentiallyNilValue = 10

/*
 If you try to assign nil to a non-optional type, you will get a compilation error!
 
 **Exercise 1**
 
 Try fixing the error in the line below:
 */

let anotherVariable: Int = nil

/*
 You can use non-optional types when you are certain
    that a variable will always hold a valid value.
 You can use optional types when you don't have that
    certainty.
 
 For example, the function that converts a String to
    an Int returns an optional, because you can't be
    sure that the String will convert to a valid Int.
 */

let validString = "123"
let validConverted = Int(validString)

let invalidString = "abc"
let invalidConverted = Int(invalidString)


/*
 Now that we have an optional Int, how do we use it?
 How do we know whether or not it has a value?
 
 This is usually done using an optional binding,
    often using an if let construct,
    which unwraps the value of an optional type
    to a non-optional variable.
 
 You can think of this as something similar to
    `if validConverted != nil` in C, but it places
    the valid value into another variable.
 
 If the optional is nil, the branch is not taken.
 */

// This evaluates to true
if let value = validConverted {
    print(value)
}

// This evaluates to false, so the if is not entered
if let value = invalidConverted {
    print(value)
}

/*
 You can also call functions from optional types
    using optional chaining, using a ?.
 This way, the function returns the expected value if the optional is not nil, or returns nil if it is.
 */

var optionalString: String?

optionalString?.count

optionalString = "abc"

optionalString?.count
 
/*
 If you pass an optional type to a function that
    expects a non-optional, you will get a
    compilation error.
 
 **Exercise 2**
 
 Use two optional bindings to avoid the compilation error in the call to the add function.
 */

func add(a: Int, b: Int) -> Int {
    a+b
}

add(a: validConverted, b: invalidConverted)

/*
 If at a certain point of the code you are certain
    that an optional has a value, you can force
    unwrap its value using !.
 
 However, if you try to force unwrap and the value is
    nil, you'll get a runtime error!
 */

// This is OK, since we know it is 123
validConverted!

// This will cause your program to crash!
// Delete or comment out this line.
invalidConverted!

/*
 A safer alternative is to provide a default value
    with ??.
 */

// Since invalidConverted is nil, we resort to the default value of 0.
invalidConverted ?? 0

add(a: validConverted ?? 0, b: invalidConverted ?? 0)

/*
 **Exercise 3**
 
 Implement the `div` function that takes two Doubles
    and returns their quotient as a Double?.
 The return value should be nil if the divisor is 0.
 */

func div(a: Double, b: Double) -> Double? {
    
}

div(a: 4, b: 2)

div(a: 3, b: 0)

/*
 **Exercise 4**
 
 Implement the arrayOfInts function, which returns
    an Array of Ints containing only the
    numbers found in the String below.
 Tip: use the string.split(separator:) method to separate the String into an Array of Strings.
 */

func arrayOfInts(string: String) -> [Int] {
    
}

arrayOfInts(string: "A 3 B 4 3 2 C 5 D 2 E F G 6")

//: [Next](@next)
