//
//  User.swift
//  SwiftOOP
//
//  Created by Yakup Acis on 8/11/22.
//

import Foundation

enum UserType{
    case AdminUser
    case NormalUser
    case PrivateUser
}

class User{
    
    var name : String = ""
    var age : Int = 0
    var job : String = ""
    var type : UserType
    private var hairColor : String = "black"
    
    // Initalizer
    
    init(name: String, age: Int, job: String, type: UserType) {
        
        self.name = name
        self.age = age
        self.job = job
        self.type = type
    }
    
    func exampleFunc(){
        print("Example Func!")
    }
    
    // Access Levels
    
    // Open, Public, Internal(Default), Fileprivate(Only File), Private(Only Class)
    
    func getHairColor() -> String{
        return self.hairColor
    }
    
}
