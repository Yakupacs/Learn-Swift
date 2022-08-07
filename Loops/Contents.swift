import UIKit

// Loops

// While Loop

5 == 5
5 != 5

10 <= 10

var x = 0
while x < 10{
    print(x)
    x += 1
}


// For Loop

var myArray = ["Yakup", "Samil", "Muhammed", "Enes", "Acis", "Murat"]

print(myArray)

for element in myArray {
    print("Element:" + element.uppercased())
}

var numberArray = [10,20,30,40,50,60,70,80,90]

numberArray[0] / 5 * 3

for number in numberArray { print(number / 5 * 3) }

for newNumber in 1...200{
    print(newNumber)
}

// If Statements

// AND &&
// OR ||

3 == 3 && 4 == 4
3 != 3 && 4 == 4
3 != 3 || 4 == 4

var myAge = 22

if myAge < 20 {
    print("You are so young!")
}
else if myAge > 20 && myAge < 30 {
    print("You are 20-30")
}
else if myAge < 30 && myAge < 40 {
    print("You are 30-40")
}
else {
    print("You are 40+")
}
