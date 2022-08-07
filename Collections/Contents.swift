import UIKit

// Collections

// Array

var firstRange = ["Yakup", "Ali", "Muhammed", "Samil"]

// Index

firstRange[0]
firstRange[1]
firstRange[2]
firstRange[3]

firstRange.capacity
firstRange.count
firstRange.first
firstRange.lazy
firstRange.reverse()

var secondRange = [41.0, 42.0, 43.0, 44.0]
secondRange[2] * 5 / 10

var mixedRange = ["yakup", 1, 3.13, true] as [Any]

// as -> casting, any -> any object

var newVariable = mixedRange[0] as! String

mixedRange.append("Ankara")
mixedRange.count
mixedRange[mixedRange.count - 1]
mixedRange.last

var mixedNumber = [15,3,67,32,56,11]
mixedNumber.sort()

// Set

var numbers = [1,1,1,1,2,3,4,4,5,6,7,7,8]

var numberSet : Set = [1,1,1,1,2,3,4,4,5,6,7,7,8]
numberSet.sorted()

var deliveryRange = ["Istanbul", "Istanbul", "Istanbul", "Ankara", "Izmir"]
deliveryRange.count

var deliverySet = Set(deliveryRange)
deliverySet.count

let firstSet : Set = [3,4,5]
let secondSet : Set = [5,6,7,8]
let unionSet = firstSet.union(secondSet)
unionSet.sorted()

// Dictionary

// Key - Value Pairing

var fruitCalorieDictionary = ["Apple" : 330, "Banana" : 600, "Strawberry" : 150]
fruitCalorieDictionary.keys
fruitCalorieDictionary.values

fruitCalorieDictionary["Banana"] = 550
fruitCalorieDictionary
