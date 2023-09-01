//
//  UserStruct.swift
//  Advanced Swift
//
//  Created by Yakup Acis on 8/18/22.
//

import Foundation

struct UserStruct{
    
    var name: String
    var age: Int
    var job: String
    // Self initialize
    
    mutating func ageAddOne(){
        self.age += 1
    }
}
