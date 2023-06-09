//
//  CryptoCurrency.swift
//  Crypto Crazy MVVM App
//
//  Created by Yakup on 9.06.2023.
//

import Foundation

// Dışarıdan gelen verinin bu structtaki verilerin adı ile uyuşması durumunda Decodable kullanıp Swift'in bu verileri struct'a kolayca aktarmasını sağlayabiliyoruz.
// Dışarıya veri göndericekken : Encodable
// İkisi de yapılacaksa : Codable

struct CryptoCurrency : Decodable {
    let currency : String
    let price : String
}
