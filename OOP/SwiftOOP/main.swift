//
//  main.swift
//  SwiftOOP
//
//  Created by Yakup Acis on 8/11/22.
//

import Foundation

let yakup = User(name: "Yakup", age: 22, job: "Mobile", type: .AdminUser)

let ali = User(name: "Ali", age: 35, job: "Engineer", type: .NormalUser)

let kerim = PrivateUser(name: "Kerim", age: 11, job: "Kind", type: .NormalUser)

kerim.exampleFunc()
ali.exampleFunc()
print(ali.getHairColor())
