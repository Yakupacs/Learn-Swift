import UIKit

// Generics, türden bağımsız işlem yapmayı sağlar. C++ template, Java ve C#'taki generic gibidir.

// MARK: - No generics
func getMax(dizi items: [Int]) -> Int
{
    var max = items[0]

    for number in items {
        if max < number{
            max = number
        }
    }
    return max
}

let sayiDizisi = [3, 4, 1, -5, 9]
getMax(dizi: sayiDizisi)    // 9

let sayiDizisi2 = [3.32, 4.53, 1.12, -5.0, 9.5]
// getMax(dizi: sayiDizisi2)
// ERROR: Cannot convert value of type '[Double]' to expected argument type '[Int]'


// MARK: - T Generic
func swap<T>(_ item1: inout T, _ item2: inout T)
{
    let tmp = item1
    item1 = item2
    item2 = tmp
}

var name = "Yakup"
var surname = "Acis"

print("\(name), \(surname)") // "Yakup, Acis"
swap(&name, &surname)
print("\(name), \(surname)") // "Acis, Yakup"

var num1 = 1
var num2 = 20

print("\(num1), \(num2)") // "1, 20"
swap(&num1, &num2)
print("\(num1), \(num2)") // "20, 1"


// MARK: - Struct T Generic
struct Stack<T> {
    private var stack: [T]

    init()
    {
        stack = [T]()
    }

    mutating func push(val: T)
    {
        stack.append(val)
    }

    mutating func pop() -> T
    {
        return stack.removeLast()
    }

    var isEmpty: Bool {
        return stack.isEmpty
    }

    var count : Int {
        return stack.count
    }
    
    func show()
    {
        for (index,i) in stack.enumerated()
        {
            print("\(index + 1).element: \(i)")
        }
    }
}

var stackString = Stack<String>()
stackString.push(val: "Hello ")
stackString.push(val: "Yakup ")
stackString.push(val: "Acis!")
stackString.pop()
stackString.show()

var stackInt = Stack<Int>()
stackInt.push(val: 11)
stackInt.push(val: 22)
stackInt.push(val: 33)
stackInt.pop()
stackInt.show()


// MARK: - Comparable T Generic
func findIndex<T: Comparable>(of valueToFind: T, in array: [T]) -> Int?
{
    for (index, value) in array.enumerated()
    {
        if (value == valueToFind)
        {
            return index + 1
        }
    }
    return nil
}

let languages = ["Swift", "Java", "C", "C#", "C++", "Python", "Ruby", "Kotlin"]

if let result = findIndex(of: "Java", in: languages)
{
    print("The element's index is \(result)")
}
else
{
    print("Not finding!")
}


// MARK: - Comparable T Generic
func getMax<T: Comparable>(_ items: [T]) -> T
{
    var max = items[0]

    for number in items {
        if max < number{
            max = number
        }
    }
    return max
}

let intArray = [45, 21, 53, 98, 10]
print(getMax(intArray)) // 98

let doubleArray = [45.34, 21.12, 53.43, 97.9, 10.55]
print(getMax(doubleArray)) // 97.9
