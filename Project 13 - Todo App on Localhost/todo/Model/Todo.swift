//
//  Todo.swift
//  todo
//
//  Created by Yakup on 21.01.2023.
//

import Foundation

struct Todos: Codable{
    let items: [Todo]
}

struct Todo: Codable{
    let item: String
    let priority: Int
    
}
