//
//  ViewController.swift
//  URLSessionCalismasi
//
//  Created by Yakup Acis on 9/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //kisiEkle(kisi_ad: String(a*a), kisi_tel: "43434")
        //kisiSil(kisi_id: a);
        //kisiGuncelle(kisi_id: 232, kisi_ad: "ada", kisi_tel: "34523534")
        //tumKisilerJSONParse()
        tumKisilerJSONParseCodable()
        //aramaYap(kisi_ad: "a")
    }

    func kisiEkle(kisi_ad : String, kisi_tel : String){
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            
            if error != nil || data == nil{
                print("Hata")
                return
            }
            
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
                
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiSil(kisi_id : Int){
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_id=\(kisi_id)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil || data == nil{
                print("Hata")
                return
            }
            
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
                
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    func kisiGuncelle(kisi_id : Int, kisi_ad : String, kisi_tel: String){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_id=\(kisi_id))&kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil || data == nil{
                print("Hata")
                return
            }
            
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
                
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func tumKisilerJSONParse(){
        
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            
            do{
            
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                
                    
                    // JSON PARSE !!
                    if let kisiler = json["kisiler"] as? [[String:Any]]{
                        for kisi in kisiler{
                            print("Kisi id: \(kisi["kisi_id"]!)")
                            print("Kisi ad: \(kisi["kisi_ad"]!)")
                            print("Kisi tel: \(kisi["kisi_tel"]!)\n")
                        }
                    }
                    
                    
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func tumKisilerJSONParseCodable(){
        
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            
            do{
            
                let cevap = try JSONDecoder().decode(KisiCevap.self, from: data!)
                
                for kisi in cevap.kisiler! {
                    print("Kisi id: \(kisi.kisi_id!)")
                    print("Kisi ad: \(kisi.kisi_ad!)")
                    print("Kisi tel: \(kisi.kisi_tel!)\n")
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func aramaYap(kisi_ad:String){
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_ad=\(kisi_ad)"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            
            do{
            
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

