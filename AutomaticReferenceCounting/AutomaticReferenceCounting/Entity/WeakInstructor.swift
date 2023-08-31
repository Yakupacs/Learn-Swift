//
//  Instructor.swift
//  AutomaticReferenceCounting
//
//  Created by Yakup on 31.08.2023.
//

import Foundation

class WeakInstructor
{
    let name : String
    var course : WeakCourse?
    
    init(name: String)
    {
        self.name = name
    }
    deinit
    {
        print("WeakInstructor \(name) deinitialized!")
    }
}

class WeakCourse
{
    let name : String
    let url : URL
    weak var instructor : WeakInstructor?
    
    init(name: String, url: URL)
    {
        self.name = name
        self.url = url
    }
    deinit
    {
        print("WeakCourse \(name) deinitialized!")
    }
}
