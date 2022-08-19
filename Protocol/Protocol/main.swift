//
//  main.swift
//  Protocol
//
//  Created by Yakup Acis on 8/18/22.
//

import Foundation

protocol Running{
    func myRun()
}

class Animal{
    func test(){
        print("Test.")
    }
}

class Dog : Running {
    func myRun() {
        print("Dog running.")
    }
    
    
}

let barley = Dog()

class Cat : Animal, Running{
    func myRun() {
        print("running")
    }
    
}

let cat = Cat()

class Turtle : Animal{
    
}

let leonardo = Turtle()

barley.myRun()
cat.test()
cat.myRun()

struct Bird : Running{
    func myRun() {
        print("Running")
    }
    
    
}

let tweety = Bird()
tweety.myRun()
