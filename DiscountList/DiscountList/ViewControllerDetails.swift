//
//  ViewControllerDetails.swift
//  DiscountList
//
//  Created by Yakup Acis on 8/11/22.
//

import UIKit

class ViewControllerDetails: UIViewController {
    
    @IBOutlet weak var productTrademark: UITextField!
    @IBOutlet weak var productLocation: UITextField!
    @IBOutlet weak var productSize: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keywordClose))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func keywordClose(){
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
    }
    
}
