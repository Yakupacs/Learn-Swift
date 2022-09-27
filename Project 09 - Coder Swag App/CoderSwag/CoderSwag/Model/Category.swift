//
//  Category.swift
//  CoderSwag
//
//  Created by Yakup Acis on 9/21/22.
//

import Foundation
import UIKit

struct Category{
    private(set) public var title: String!
    private(set) public var imageName: String!
    
    init(title : String, imageName: String) {
        self.title = title
        self.imageName = imageName 
    }
}
