//
//  ViewController.swift
//  Warning Messages
//
//  Created by Yakup Acis on 8/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwd2TextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func alertFunction(head : String, content : String){
        let warnMessage = UIAlertController(title: head, message: content, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default) { (UIAlertAction) in
        }
        warnMessage.addAction(okButton)
        self.present(warnMessage, animated: true, completion: nil)
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        
        if emailTxtField.text == ""{
            alertFunction(head: "Warning!", content: "The email is empty!")
        }
        else if passwdTextField.text == ""{
            alertFunction(head: "Warning!", content: "The password is empty!")
        }
        else if passwd2TextField.text != passwdTextField.text{
            alertFunction(head: "Warning!", content: "The passwords are difference!")
        }
        else {
            alertFunction(head: "Warning!", content: "The register is successfully")
        }
        
        

        
    }
    

}

