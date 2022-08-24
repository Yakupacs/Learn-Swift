//
//  ViewController.swift
//  UIActivityIndicator
//
//  Created by Yakup Acis on 8/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextfield.isSecureTextEntry = true
    }
    @IBAction func loginFunc(_ sender: Any) {
        if usernameTextfield.text == "yakupacs"{
            if passwordTextfield.text == "12345"{
                // START ACTIVITY INDICATOR
                activityIndicatorView.startAnimating()
            }
            else{
                let warning = UIAlertController.init(title: "Warning!", message: "The password or username is wrong." , preferredStyle: .alert)
                let okey = UIAlertAction(title: "Warning", style: .default) { (UIAlertAction) in
                }
                warning.addAction(okey)
                self.present(warning, animated: true, completion: nil)
            }
        }
        else{
            let warning = UIAlertController.init(title: "Warning!", message: "The password or username is wrong." , preferredStyle: .alert)
            let okey = UIAlertAction(title: "Warning", style: .default) { (UIAlertAction) in
            }
            warning.addAction(okey)
            self.present(warning, animated: true, completion: nil)
        }

    }
}

