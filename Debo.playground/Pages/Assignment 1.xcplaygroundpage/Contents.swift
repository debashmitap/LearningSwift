import PlaygroundSupport

/*
 Assignment 1: Interesting Numbers
 
 Below are a few interesting numbers organized in a data structure.
 Can you tell what is the type of this data structure?
 
 It is [String:[Int]]; a dictionary with Strings as keys and Arrays of Int as values.
 */

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25, 36]
]

/*
 Let's do something with this data.
 
 First, can you print how many numbers are in this structure, in total?
 */
var count = 0
for (_,numbers) in interestingNumbers
{
   count = count + numbers.count

}
print(count)

/*
 Now, can you find out which is the largest number in the structure?
 */
var largest = 0
for (_,numbers) in interestingNumbers
{
    for i in 0..<numbers.count
    {
        if (largest<numbers[i])
        {
            largest=numbers[i]
        }
    }
}

print(largest)

/*
 Then, how much is the sum of all the numbers in the structure?
*/

var sum = 0

for (_,numbers) in interestingNumbers
{
    for i in 0..<numbers.count
    {
        sum=sum+numbers[i]
    }
}

print(sum)

/*
 Finally, what is the average value of the numbers in the structure?
 tip: use the Double type to avoid rounding the number down to an Int.
 */

var avg = Double(sum)/Double(count)

print(avg)

//: [Next](@next)
