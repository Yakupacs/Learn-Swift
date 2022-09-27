//
//  Product.swift
//  CoderSwag
//
//  Created by Yakup Acis on 9/24/22.
//

import Foundation

struct Product{
    private(set) public var title : String
    private(set) public var price : String
    private(set) public var imageName : String
    
    init(title : String, price : String, imageName : String) {
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}
