//
//  ViewController.swift
//  SQLiteFirstApp
//
//  Created by Yakup Acis on 9/27/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        databaseCopy()
        //Kisilerdao().kisiEkle(kisi_ad: "Ahmet", kisi_yas: 20)
        //Kisilerdao().kisiSil(kisi_id: 4)
        //Kisilerdao().kisiGuncelle(kisi_id: 1, kisi_ad: "Ali", kisi_yas: 26)
        //print(Kisilerdao().kisiKontrol(kisi_ad: "Ahmet"))
        let gelenliste = Kisilerdao().rastgele2kisiAl()
        //let gelenKisi = Kisilerdao().kisiGetir(kisi_id: 7)
        //print("ID: \(gelenKisi.kisi_id!)\nAD: \(gelenKisi.kisi_adi!)\nYAS: \(gelenKisi.kisi_yas!)")
        //let arananliste = Kisilerdao().aramaYap(kisi_ad: "m")
        
        for k in gelenliste{
            print("ID: \(k.kisi_id!)\nAD: \(k.kisi_adi!)\nYAS: \(k.kisi_yas!)")
        }
    }

    func databaseCopy(){
        let bundleYolu = Bundle.main.path(forResource: "kisilergiris", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("kisilergiris.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var.\nKopyalamaya gerek yok.")
        }
        else{
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath:kopyalanacakYer.path)
            } catch{
                print(error)
            }
        }
    }
    
}

