//
//  Entity.swift
//  CryptoViper
//
//  Created by Yakup on 25.12.2022.
//

import Foundation

// Sayfanın hem kullanacağı hem de yapacağı işler için kullanacağı model sınıflarıdır.

// Struct

struct Crypto : Decodable{
    let currency : String
    let price : String
}
