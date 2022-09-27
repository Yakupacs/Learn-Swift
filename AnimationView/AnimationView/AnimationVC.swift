//
//  ViewController.swift
//  AnimationView
//
//  Created by Yakup Acis on 9/27/22.
//

import UIKit

class AnimationVC: UIViewController {

    @IBOutlet weak var havaDurumuLbl: UILabel!
    @IBOutlet weak var baslaBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func baslaButton(_ sender: Any) {
        ardisikAnimation()
    }
    
    func scaleAnimation(){
        //BÜYÜTME
        UIView.animate(withDuration: 2, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        })
        UIView.animate(withDuration: 2, delay: 2, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    func alphaAnimasyon(){
        //SAYDAMLAŞTIRMA
        self.imageView.alpha = 0
        UIView.animate(withDuration: 5, animations: {
            self.imageView.alpha = 1
        },completion: nil)
    }
    
    func rotateAnimation(){
        //DÖNDÜRÜLME İŞLEMİ
        UIView.animate(withDuration: 1, animations: {
            self.imageView.transform = CGAffineTransform(rotationAngle: 180 * .pi/180)
        })
    }
    
    func translationAnimation(){
        UIView.animate(withDuration: 1, animations: {
            self.imageView.transform = CGAffineTransform(translationX: 50, y: 0)
        })
    }
    
    func gecikmeAnimation(){
        UIView.animate(withDuration: 1,
                       delay: 1,
                       animations: {
            self.imageView.transform = CGAffineTransform(translationX: 0, y: 100)
        })
    }
    
    func ivmeAnimation(){
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
            self.imageView.transform = CGAffineTransform(translationX: 0, y: 100)
        })
    }
    
    func tekrarliAnimation(){
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.repeat,.autoreverse],
                       animations: {
            self.imageView.transform = CGAffineTransform(translationX: 0, y: 50)
        })
    }
    
    func cokluAnimation(){
        UIView.animate(withDuration: 1, animations: {
            let hareket = CGAffineTransform(translationX: 0, y: 50)
            let kucul = CGAffineTransform(scaleX: 0.5, y: 0.5)
            let don = CGAffineTransform(rotationAngle: 90 * .pi/180)
            
            let x = hareket.concatenating(kucul)
            
            self.imageView.transform = don.concatenating(x)
            
            self.imageView.alpha = 0
        })
    }
    
    func ardisikAnimation(){
        UIView.animate(withDuration: 1, animations: {
            
            self.imageView.alpha = 0
            
        },completion: { (true) in
            UIView.animate(withDuration: 1, animations: {
                
                self.havaDurumuLbl.alpha = 0
                
            }, completion: { (true) in
                
                UIView.animate(withDuration: 1, animations: {
                    
                    self.baslaBtn.alpha = 0
                    
                }, completion: nil)
                
            })
        })
    }
    
}
