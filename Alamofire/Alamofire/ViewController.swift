//
//  ViewController.swift
//  AlamofireKurulum
//
//  Created by Yakup Acis on 9/29/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        aramaYap(kisi_ad: "a")
    }
    
    func kisiEkle(kisi_adi: String, kisi_tel: String){
        let parametreler:Parameters = ["kisi_ad": kisi_adi,"kisi_tel":kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: parametreler).responseJSON{ response in
            
            if let data = response.data{
                
                do{
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    
    func kisiSil(kisi_id : String){
        let parametreler:Parameters = ["kisi_id":kisi_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: parametreler).responseJSON{ response in
            
            if let data = response.data{
                
                do{
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    
    func kisiGuncelle(kisi_id : String, kisi_ad : String, kisi_tel: String){
        let parametreler:Parameters = ["kisi_id":kisi_id, "kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php", method: .post, parameters: parametreler).responseJSON{ response in
            
            if let data = response.data{
                
                do{
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    
    func tumKisiler(){
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json", method: .get).responseJSON{ response in
                
                if let data = response.data {
                    
                    do{
                        
                        let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                        
                        if let kisiListesi = cevap.kisiler{
                            
                            for kisi in kisiListesi{
                                
                                print("Kisi id: \(kisi.kisi_id!)")
                                print("Kisi ad: \(kisi.kisi_ad!)")
                                print("Kisi tel: \(kisi.kisi_tel!)\n")
                            }
                            
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }
           
            
        }
    }
    
    func aramaYap(kisi_ad: String){
        let parametreler:Parameters = ["kisi_ad":kisi_ad]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: parametreler).responseJSON{ response in
            
            if let data = response.data{
                
                do{
                    
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    
                    if let kisiListesi = cevap.kisiler{
                        
                        for kisi in kisiListesi{
                            
                            print("Kisi id: \(kisi.kisi_id!)")
                            print("Kisi ad: \(kisi.kisi_ad!)")
                            print("Kisi tel: \(kisi.kisi_tel!)\n")
                        }
                        
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }

}

