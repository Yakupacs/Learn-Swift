//
//  Instructor.swift
//  AutomaticReferenceCounting
//
//  Created by Yakup on 31.08.2023.
//

import Foundation

// Value Type
struct LaunchedCourse
{
    let title : String
    var isLaunched : Bool = false
    
    init(title: String) {
        self.title = title
    }
}

// Reference Type
class WeakInstructor2
{
    let name : String
    var course : WeakCourse2?
    
    init(name: String)
    {
        self.name = name
    }
    deinit
    {
        print("WeakInstructor2 \(name) deinitialized!")
    }
}

class WeakCourse2
{
    let name : String
    let url : URL
    weak var instructor : WeakInstructor2?
    
    var launchedCourses : [LaunchedCourse] = []
    var onLaunched : ((_ launchedCourse : LaunchedCourse) -> Void)?
    
    func launch(launchCourse: LaunchedCourse)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3)
        {
            self.onLaunched?(launchCourse)
        }
    }
    
    init(name: String, url: URL)
    {
        self.name = name
        self.url = url
        
        // [weak self] -> optional
        // [unowned self] -> non-optional
        
        onLaunched = { [weak self] launchedCourse in
            self?.launchedCourses.append(launchedCourse)
            print("\(launchedCourse.title) added! Launched Course Count: \(String(describing: self?.launchedCourses.count))")

        }
    }
    deinit
    {
        print("WeakCourse2 \(name) deinitialized!")
    }
}
