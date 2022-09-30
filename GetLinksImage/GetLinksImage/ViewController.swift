//
//  ViewController.swift
//  GetLinksImage
//
//  Created by Yakup Acis on 9/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resim1Button: UIButton!
    @IBOutlet weak var resim2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func resim1Func(_ sender: Any) {
        
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/thehatefuleight.png"){
            
            DispatchQueue.global().async {
                
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
                
            }
            
        }
        
    }
    
    @IBAction func resim2Func(_ sender: Any) {
        
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/interstellar.png"){
            
            DispatchQueue.global().async {
                
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
                
            }
            
        }
    }
    
}

