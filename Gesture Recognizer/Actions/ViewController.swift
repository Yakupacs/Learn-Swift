//
//  ViewController.swift
//  Actions
//
//  Created by Yakup Acis on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var istanbul2 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changeImage(){
        if istanbul2 == false{
            imageView.image = UIImage(named: "istanbul2")
            label.text = "Galata Kulesi"
            istanbul2 = true
            view.backgroundColor = UIColor.brown
        }
        else{
            imageView.image = UIImage(named: "istanbul")
            label.text = "Kız Kulesi"
            istanbul2 = false
            view.backgroundColor = UIColor.darkGray
        }
    }

}

