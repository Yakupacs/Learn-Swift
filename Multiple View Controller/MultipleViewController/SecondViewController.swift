//
//  SecondViewController.swift
//  MultipleViewController
//
//  Created by Yakup Acis on 8/8/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondScreenLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var verilenSifre = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordLabel.text = verilenSifre
    }
    
    
}
