import UIKit

var str = "Hello, playground"

func sum(num1 : Int, num2: Int) -> Int{
    return num1 + num2
}

sum(num1: 22, num2: 20)

// Sum -> (Int, Int) -> Int

func calculate(num1: Int, num2: Int, myFunction: (Int, Int) -> Int) -> Int{
    return myFunction(num1, num2)
}

calculate(num1: 21, num2: 4, myFunction: sum)

calculate(num1: 34, num2: 3, myFunction: { (num1: Int, num2: Int) -> Int in
    return num1 * num2
})

calculate(num1: 32, num2: 3, myFunction: { (num1, num2) -> Int in
    return num1 * num2
})


calculate(num1: 30, num2: 3, myFunction: { (num1, num2) in
    return num1 * num2
})

calculate(num1: 28, num2: 3, myFunction: { (num1, num2) in num1 * num2 })

calculate(num1: 28, num2: 3, myFunction: { $0 * $1 })

let myArray = [10,20,30,40,50]

func test(num1: Int) -> Int{
    return num1 / 5
}

myArray.map(test)

print(myArray.map({$0 / 5}))
