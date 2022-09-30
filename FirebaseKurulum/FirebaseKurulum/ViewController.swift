//
//  ViewController.swift
//  FirebaseKurulum
//
//  Created by Yakup Acis on 9/30/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
   
        //kisiEkle(kisi: kisi)
        //kisiSil(id: "-NDEJwieFwaxDnh1SIsT")
        //kisiGuncelle(kisi: kisi, id: "-NDEJwieFwaxDnh1SIsT")
        //tumKisiler()
        //kisiEqualSorgu()
        //kisiLimitSorgu(toLast: 2)
        //kisiDegerAraligiSorgu(startValue: 1, endValue: 2)
    }

    func kisiEkle(kisi: Kisiler){
        let dict : [String:Any] = ["kisi_ad":kisi.kisi_ad!,"kisi_yas":kisi.kisi_yas!]
        
        let newRef = ref?.child("kisiler").childByAutoId()
        
        newRef?.setValue(dict)
    }
    
    func kisiSil(id: String){
        ref?.child("kisiler").child(id).removeValue()
    }
    
    func kisiGuncelle(kisi: Kisiler, id: String){
        let dict : [String:Any] = ["kisi_ad":kisi.kisi_ad!,"kisi_yas":kisi.kisi_yas!]
        
        ref?.child("kisiler").child(id).updateChildValues(dict)
    }
    
    func tumKisiler(){
        ref?.child("kisiler").observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String:Any]{
                
                for gelenSatirVerisi in gelenVeriButunu{
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)\n")
                        
                        
                    }
                    
                }
                
            }
            
        })
    }
    
    func kisiEqualSorgu(){
        
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_ad").queryEqual(toValue: "Yakup")
        
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String:Any]{
                
                for gelenSatirVerisi in gelenVeriButunu{
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)\n")
                        
                        
                    }
                    
                }
                
            }
            
        })
    }
    
    func kisiLimitSorgu(toLast: Int){
        
        let sorgu = ref?.child("kisiler").queryLimited(toLast: toLast)
        
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String:Any]{
                
                for gelenSatirVerisi in gelenVeriButunu{
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)\n")
                        
                        
                    }
                    
                }
                
            }
            
        })
    }
    
    func kisiDegerAraligiSorgu(startValue: Int, endValue: Int){
        
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_yas").queryStarting(atValue: startValue).queryEnding(atValue: endValue)
        
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String:Any]{
                
                for gelenSatirVerisi in gelenVeriButunu{
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)\n")
                        
                        
                    }
                    
                }
                
            }
            
        })
    }

}

