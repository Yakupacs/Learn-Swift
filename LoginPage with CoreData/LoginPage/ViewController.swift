//
//  ViewController.swift
//  LoginPage
//
//  Created by Yakup Acis on 8/13/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
}

