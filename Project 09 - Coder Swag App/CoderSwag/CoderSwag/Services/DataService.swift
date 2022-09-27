//
//  File.swift
//  CoderSwag
//
//  Created by Yakup Acis on 9/21/22.
//

import Foundation

class DataService{
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirtwallpaper.jpeg"),
        Category(title: "HOODIES", imageName: "hoodieswallpaper.jpeg"),
        Category(title: "HATS", imageName: "hatswallpaper.jpeg"),
        Category(title: "DIGITAL", imageName: "digital.jpeg")
    ]
    
    private let hats = [
        Product(title: "Devslopes Logo Graphic Beanie", price: "$18", imageName: "hat1"),
        Product(title: "Devslopes Logo Hat Black", price: "$23", imageName: "hat2"),
        Product(title: "Devslopes Logo Hat White", price: "$14", imageName: "hat3"),
        Product(title: "Devslopes Logo Snapback", price: "$8", imageName: "hat4"),
        Product(title: "Devslopes Logo Graphic Beanie", price: "$22", imageName: "hat5")
    ]
    
    private let hoodies = [
        Product(title: "Devslopes Logo Hoodie Grey", price: "$33", imageName: "hoodie1"),
        Product(title: "Devslopes Logo Hoodie Red", price: "$35", imageName: "hoodie2"),
        Product(title: "Devslopes Hoodie Grey", price: "$32", imageName: "hoodie3"),
        Product(title: "Devslopes Hoodie Black", price: "$23", imageName: "hoodie4")
    ]
    
    private let shirts = [
        Product(title: "Devslopes Logo Shirt Black", price: "$22", imageName: "shirt1"),
        Product(title: "Devslopes Badge Shirt Light Gray", price: "$25", imageName: "shirt2"),
        Product(title: "Devslopes Logo Shirt Red", price: "$14", imageName: "shirt3"),
        Product(title: "Hustle Delegate Grey", price: "$18", imageName: "shirt4"),
        Product(title: "Kickflip Studios Black", price: "$18", imageName: "shirt5")
    ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category]{
        return categories
    }
    
    func getProducts(forCategoryTitle title : String) -> [Product]{
        switch title {
        case "SHIRTS":
            return getShirts()
        case "HATS":
            return getHats()
        case "HOODIES":
            return getHoodies()
        case "DIGITAL":
            return getDigitalGoods()
        default:
            return getShirts()
        }
    }
    
    func getHats() -> [Product]{
        return hats
    }
    
    func getHoodies() -> [Product]{
        return hoodies
    }
    
    func getShirts() -> [Product]{
        return shirts
    }
    
    func getDigitalGoods() -> [Product]{
        return digitalGoods
    }
}
 
