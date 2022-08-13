//
//  ViewControllerLogin.swift
//  LoginPage
//
//  Created by Yakup Acis on 8/13/22.
//

import UIKit
import CoreData

class ViewControllerLogin: UIViewController {

    
    var usernameArray = [String]()
    var passwordArray = [String]()
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var sendUsername = ""
    var sendPassword = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
        print(usernameArray)
        print(passwordArray)
        // Do any additional setup after loading the view.
    }
    
    @objc func alertFunction(head : String, content : String){
        let warnMessage = UIAlertController(title: head, message: content, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default) { (UIAlertAction) in
           }
           warnMessage.addAction(okButton)
        self.present(warnMessage, animated: true, completion: nil)
        passwordTxt.text = ""
        usernameTxt.text = ""
       }
    
    @IBAction func loginFunc(_ sender: Any) {
        
        if usernameTxt.text != "" && passwordTxt.text != ""{
            for usernames in usernameArray{
                if(usernames == usernameTxt.text!){
                    for passwords in passwordArray{
                        if(passwords == passwordTxt.text!){
                            sendUsername = usernameTxt.text!
                            sendPassword = passwordTxt.text!
                            performSegue(withIdentifier: "toUserDetails", sender: nil)
                            
                        }
                        else{
                            alertFunction(head: "Warning!", content: "Username or password is incorrect.")
                        }
                    }
                }
                else{
                    alertFunction(head: "Warning!", content: "Username or password is incorrect.")
                }
            }
        }

        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUserDetails"{
            let desVC = segue.destination as! ViewControllerUserDetails
            desVC.password = sendPassword
            desVC.username = sendUsername
            
        }
    }
    
    func getUserData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let users = try context.fetch(fetchRequest)
            
            for user in users as! [NSManagedObject]{
                if let username = user.value(forKey: "username") as? String{
                    usernameArray.append(username)
                }
                if let password = user.value(forKey: "password") as? String{
                    passwordArray.append(password)
                }
            }
            
        } catch {
            print("Warning! Data is not reload.")
        }
    }

    
}
