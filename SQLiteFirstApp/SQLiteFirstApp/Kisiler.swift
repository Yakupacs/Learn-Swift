//
//  Kisiler.swift
//  SQLiteFirstApp
//
//  Created by Yakup Acis on 9/27/22.
//

import Foundation

class Kisiler{
    var kisi_id : Int?
    var kisi_adi : String?
    var kisi_yas : Int?
    
    init(){
        
    }
    
    init(kisi_id : Int, kisi_adi : String, kisi_yas : Int) {
        self.kisi_id = kisi_id
        self.kisi_adi = kisi_adi
        self.kisi_yas = kisi_yas
    }
}
