//
//  Kisilerdao.swift
//  SQLiteFirstApp
//
//  Created by Yakup Acis on 9/27/22.
//

import Foundation

class Kisilerdao{
    
    let db : FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("kisilergiris.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kisiEkle(kisi_ad:String, kisi_yas:Int){
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_yas) VALUES (?,?)", values: [kisi_ad, kisi_yas])
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func tumKisilerAl() -> [Kisiler]{
        var liste = [Kisiler]()
        db?.open()
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while rs.next() {
                let kisi = Kisiler(
                    kisi_id: Int(rs.string(forColumn: "kisi_id")!)!,
                    kisi_adi: rs.string(forColumn: "kisi_ad")!,
                    kisi_yas: Int(rs.string(forColumn: "kisi_yas")!)!)
                liste.append(kisi)
            }
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        return liste
    }
    
    func kisiSil(kisi_id: Int){
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kisiGuncelle(kisi_id:Int, kisi_ad:String, kisi_yas: Int){
        db?.open()
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_yas = ? WHERE kisi_id = ?", values: [kisi_ad, kisi_yas, kisi_id])
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kisiKontrol(kisi_ad:String) -> Int{
        var sonuc = 0
        db?.open()
        do {
            
            let rs = try db!.executeQuery("SELECT count(*) as sonuc FROM kisiler where kisi_ad = ?", values: [kisi_ad])
            
            while rs.next() {
                sonuc = Int(rs.string(forColumn: "sonuc")!)!
            }
            
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        return sonuc
    }
    
    func aramaYap(kisi_ad: String) -> [Kisiler]{
        var liste = [Kisiler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(kisi_ad)%'", values: nil)
            
            while rs.next() {
                let kisi = Kisiler(
                    kisi_id: Int(rs.string(forColumn: "kisi_id")!)!,
                    kisi_adi: rs.string(forColumn: "kisi_ad")!,
                    kisi_yas: Int(rs.string(forColumn: "kisi_yas")!)!)
                liste.append(kisi)
            }
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        return liste
    }
    
    func kisiGetir(kisi_id: Int) -> Kisiler{
        var kisi = Kisiler()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            
            while rs.next() {
                kisi = Kisiler(
                    kisi_id: Int(rs.string(forColumn: "kisi_id")!)!,
                    kisi_adi: rs.string(forColumn: "kisi_ad")!,
                    kisi_yas: Int(rs.string(forColumn: "kisi_yas")!)!)
            }
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        return kisi
    }
    
    func tumKisilerAlLIMIT() -> [Kisiler]{
        var liste = [Kisiler]()
        db?.open()
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM kisiler LIMIT 2", values: nil)
            
            while rs.next() {
                let kisi = Kisiler(
                    kisi_id: Int(rs.string(forColumn: "kisi_id")!)!,
                    kisi_adi: rs.string(forColumn: "kisi_ad")!,
                    kisi_yas: Int(rs.string(forColumn: "kisi_yas")!)!)
                liste.append(kisi)
            }
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        return liste
    }
    
    func rastgele2kisiAl() -> [Kisiler]{
        var liste = [Kisiler]()
        db?.open()
        do {
            
            let rs = try db!.executeQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 2", values: nil)
            
            while rs.next() {
                let kisi = Kisiler(
                    kisi_id: Int(rs.string(forColumn: "kisi_id")!)!,
                    kisi_adi: rs.string(forColumn: "kisi_ad")!,
                    kisi_yas: Int(rs.string(forColumn: "kisi_yas")!)!)
                liste.append(kisi)
            }
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        return liste
    }
    
}
