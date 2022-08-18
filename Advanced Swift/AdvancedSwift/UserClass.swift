//
//  UserClass.swift
//  Advanced Swift
//
//  Created by Yakup Acis on 8/18/22.
//

import Foundation

class UserClass{
    var name : String
    var age : Int
    var job : String
    
    init(name: String, age: Int, job: String) {
        self.name = name
        self.age = age
        self.job = job
    }
    
    func ageAddOne(){
        self.age += 1
    }
}
