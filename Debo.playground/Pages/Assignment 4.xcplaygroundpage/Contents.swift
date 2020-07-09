//: [Previous](@previous)

import Foundation

/*
 Assignment 4: Dictionary in memory
 
 For this assignment, we will re-implement a basic version of Dictionary.
 Our dictionary will be keyed by `String`s and contain `Int`s,
 and its capacity is fixed upon initialization.
 
 This is a sample use of our dictionary:
 
 ```
 var dict = MyDictionary(size: 10)
 dict["A"] = 2
 dict["A"] // should contain 2
 ```
 
 -------
 
 Here's how this dictionary should work.
 
 A dictionary is formed by buckets.
 Each bucket has three pieces of information:
 - a bit that determines whether or not that bucket is valid;
 - a key that is used to find the bucket;
 - and a value that is stored in the bucket.
 
 These are represented by three arrays: `bitMap`, `keys` and `values`.
 In memory, these arrays are placed sequentially, like this:
 
 bitMap      keys     values
 🟦🟦🟦🟦🟦🟧🟧🟧🟧🟧🟩🟩🟩🟩🟩
 
 Each item in `bitMap` is a single bit;
<<<<<<< Updated upstream
 the sizes of `keys` and `values` depends on the type we want.
=======
    the sizes of `keys` and `values` depend on the types we want.
>>>>>>> Stashed changes
 In this case, the size of our dictionary is something like this:
 
 (sizeOf(Bool) + sizeOf(String) + sizeOf(Int)) * capacity
 
 For easier visualization, think of each bucket as a vertical stack
 of bit, key and value, like this:
 
 b0 b1 b2 b3 b4
 bitMap:    🟦 🟦 🟦 🟦 🟦
 keys:      🟧 🟧 🟧 🟧 🟧
 values:    🟩 🟩 🟩 🟩 🟩
 
 -------
 
 There are two main operations we can perform on our dictionary: read and write.
 
 The first is to read a value from it.
 When a key is supplied to the dictionary, it must return the corresponding value.
 
 To do this, the dictionary should calculate the hash of the key;
 this is a number that uniquely represents a value.
 Then, this hash needs to be squeezed into a value within the
 bounds of the capacity of the dictionary.
 The dictionary then looks for the bucket whose key matches the given one,
 starting its search by the position determined by the squeezed hash.
 If a matching bucket is found, its value is returned; if none is found,
 the dictionary returns nil.
 
 
 The second operation is to write a value.
 The value should be stored in the bucket that corresponds to a given key.
 
 Just like in read, we need the squeezed hash of the given key.
 The dictionary then looks for an empty bucket, starting its search
 by the position determined by the squeezed hash.
 Once an empty bucket is found, it marks the bit as true, then stores
 the key and the value.
 
 -------
 
 Assignment: You must implement the empty methods of the struct below,
 in order to have a dictionary that works as described above.
 
 Tip: Start by implementing the easier methods, `squeeze` and `next`.
 Then, implement `find` and `findHole`, which use the `next` method.
 Finally, implement the `get` and the `set`, using the methods you implemented before.
 
 */


/// Simple re-implementation of a `Dictionary`.
///
/// This dictionary has `String`s as keys and `Int`s as values.
///
/// You can read and write values using a subscript: `dict[key] = value`.
struct MyDictionary {
    
    /// The number of slots allocated in memory for this dictionary.
    private var size:Int
    /// The map of valid values; if `bitMap[i]` is true, `values[i]` is a valid value.
    private var bitMap:[Bool]
    
    /// The number of valid values in the dictionary.
    var count:Int
    /// The keys of the dictionary.
    var keys:[String?]
    /// The values of the dictionary.
    var values:[Int?]
    
    /// Initializes a `MyDictionary` with memory for a fixed number of items.
    /// - Parameter size: The number of spaces to allocate in memory.
    init(size: Int)
    {
        self.size = size
        self.count = 0
        self.bitMap = [Bool](repeating: false, count: size)
        self.keys = [String?](repeating: nil, count: size)
        self.values = [Int?](repeating: nil, count: size)
    }
    
    /// Gets or sets the value in the dictionary that corresponds to the given key.
    /// - Parameter key: The key to index the value.
    ///
    /// # Example
    /// ```
    /// dict["ABC"] = 123
    /// ```
    subscript(key: String) -> Int?
    {
        /// The `get` accessor returns the value that corresponds to the given key,
        /// or `nil` if no valid value is found.
        ///
        /// Tip 1: you should use the `squeeze(hash:)`
        /// and `find(key:, startBucket:)` methods here.
        ///
        /// Tip 2: use `key.hash` to get the hash of the key.
        get
        {
            // TODO: Implement the get
            let start = squeeze(hash: key.hash)
            if let index = find(key: key, startBucket: start)
            {
                return self.values[index]
            }
            return nil
        }
        /// The `set` accessor places the `newValue` into the appropriate slot of the
        /// dictionary, according to the key.
        /// It should update the`bitMap`, `keys`, `values` and `count` properties.
        ///
        /// Tip: you should use the `squeeze(hash:)`
        /// and `findHole(startBucket:)` methods here.
        set(newValue)
        {
            let start = squeeze(hash: key.hash)
            if let index = findHole(key: key, startBucket: start)
            {
                self.count = self.count + 1
                self.bitMap[index] = true
                self.keys[index] = key
                self.values[index] = newValue
            }
            
            // TODO: Implement the set
        }
    }
    
    /// Squeezes a large hash into a value that fits within the size of the dictionary.
    /// - Parameter hash: The hash value of a key.
    /// - Returns: An `Int` between `0` and `(size - 1)`.
    func squeeze(hash: Int) -> Int
    {
        // TODO: Implement squeeze(hash:)
        return (hash % self.size)
        
    }
    
    /// The bucket that follows a given bucket; if the end of the dictionary is reached, it should loop back to 0.
    func next(bucket: Int) -> Int {
        if (self.size % bucket == 0)
        {
            return 0
        }
        return (bucket + 1)
        // TODO: Implement next()
    }
    
    /// Finds the index of a given key, starting the search from a certain bucket.
    ///
    /// Tip: You'll need to loop through buckets. Should you use `for ... in`, `while`, or `repeat while`?
    ///
    /// Tip 2: You'll need to use the `next(bucket:)` method here.
    ///
    /// - Parameters:
    ///   - key: The key to be found.
    ///   - startBucket: The bucket from which to start the search.
    /// - Returns: The index of the valid bucket that matches that key, or `nil` if no matching bucket  is found.
    func find(key: String, startBucket: Int) -> Int?
    {
        var i = startBucket
        repeat
        {
            if ((keys[i] == key) && (self.bitMap[i]))
            {
                return i
            }
            i = next(bucket: i)
        } while i != startBucket
        return nil
        // TODO: Implement find(key:, startBucket:)
    }
    
    /// Finds the index of an empty bucket, starting the search from a certain bucket.
    ///
    /// Tip: The implementation of this function is very similar to find(key:, startBucket:).
    ///     We're just looking to satisfy a different condition.
    ///
    /// - Parameter startBucket: The bucket from which to start the search
    /// - Returns: The index of the first empty bucket at or after the starting bucket, or `nil` if no empty buckets remain.
    func findHole(key: String, startBucket: Int) -> Int?
    {
        // TODO: Implement findHole(startBucket:)
        var i = startBucket
        repeat
        {
            if (keys[i] == key || !(self.bitMap[i]))
            {
                return i
            }
            i = next(bucket: i)
        } while i != startBucket
        return nil
    }
}

// Sample:
var dict = MyDictionary.init(size: 10)
dict["A"] = 2
dict["A"] // should contain 2

dict["A"] = 4
dict["A"]

dict["T"] = 89
dict["T"]

dict
//: [Next](@next)
