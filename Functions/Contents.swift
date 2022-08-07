import UIKit

func exampleFunction(){
    print("Example")
}

exampleFunction()

// Paramets

func myFunction(a : String, b : String){
    print(a + b)
}

myFunction(a : "Yakup",b : "ali")
 
// Output, return

func addition(x: Int, y:Int) -> Int{
    return (x + y)
}

print(addition(x: 3, y: 5))

func multiple(a: Int, b: Int) -> Int{
    return a*b
}

print(multiple(a: 9, b: 9))


// Optionals

var myName : String?

myName

myName = "Yakup"

myName?.uppercased()

// Force unwrapping

myName = "Yakup"

myName?.uppercased()

// Force unwrapping

var userNum = "905355355353"
var sonuc = Int(userNum)! * 5

var userNum1 = "44"
var sonuc1 = (Int(userNum1) ?? 1) * 42

var newNum2 = "55"
if let newNum2 = Int(userNum1) {
    newNum2 * 32
}
else{
    print("Error")
}
