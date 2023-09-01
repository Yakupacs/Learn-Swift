//
//  main.swift
//  Advanced Swift
//
//  Created by Yakup Acis on 8/18/22.
//

import Foundation

// Struct -> inheritance yok, stack (RAM) - filo, daha hızlı, daha basit, value type, immutable

// Class -> inheritance var, heap (RAM) - fifo , reference type, mutable

let yakupClass = UserClass(name: "Yakup", age: 22, job: "Computer Engineer")

//print(yakupClass.job)

var yakupStruct = UserStruct(name: "yakup", age: 22, job: "computer engineer")

//print(yakupStruct.job)

yakupClass.age = 33

//print(yakupClass.age) // 33

yakupStruct.age = 33

//print(yakupStruct.age) // 33


// Referans ve Değer farkı

let yakupClassCopy = yakupClass
var yakupStructCopy = yakupStruct

//print(yakupClassCopy.age) // 33
//print(yakupStructCopy.age) // 33

yakupClassCopy.age = 35
yakupStructCopy.age = 35

//print(yakupStruct.age) // 33
//print(yakupClass.age) // 35

// reference type -> class
// kopyalama yapıldığında tek bir obje, 2 referans var.

// value type -> struct
// kopyalama yapıldığında iki obje var.

yakupClass.ageAddOne()
yakupStruct.ageAddOne()


// Tuple

var myTuple = (10,20)
//print(myTuple.0)

var myTuple2 = (10,20,30,40)
//print(myTuple2.3)

myTuple2.2 = 50
//print(myTuple2.2)

let myTuple3 = ("Yakup", 42)
//print(myTuple3.0)

let myTuple4 = ("Yakup", [421,422,423,424])
//print(myTuple4.1[2])

let myNumber : Int?
let myNumberTuple : (String, String)

myNumberTuple.0 = "acis"
myNumberTuple.1 = "Yakup"

//print(myNumberTuple)

let newTuple = (name: "Yakup", surname: "Acis")

//print(newTuple.name)


// Guard Let

let num = "5"

func convertIntIfLet(string: String) -> Int{
    if let myInt = Int(string){
        return myInt
    }
    else{
        return 0
    }
}

//print(convertIntIfLet(string: num))

func convertIntGuardLet(string: String) -> Int{
    guard let myInt = Int(string) else {
        return 0
    }
    return myInt
}

//print(convertIntGuardLet(string: num))



// Switch - Case

let dayCount = 3
var dayString = ""

switch dayCount{
case 1:
    dayString = "Pazartesi"
case 2:
    dayString = "Salı"
case 3:
    dayString = "Çarşamba"
case 4:
    dayString = "Perşembe"
default:
    dayString = "Pazar"
}

//print(dayString)






// Breakpoint

var sayi = 5
print(sayi)
sayi += 1
print(sayi)
