//
//  News.swift
//  News App
//
//  Created by Yakup Acis on 8/21/22.
//

import Foundation

struct News : Decodable{
    let title: String
    let story: String
}

// GET->VERİ ÇEKMEK & POST->VERİ GÖNDERMEK
// Kendi verilerimizi gönderdiğimizde Encodable
