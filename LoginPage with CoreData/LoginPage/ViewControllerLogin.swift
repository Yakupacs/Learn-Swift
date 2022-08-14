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
    var idArray = [UUID]()
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var sendUsername = ""
    var sendPassword = ""
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
        print(usernameArray, passwordArray, idArray)
        self.navigationItem.setHidesBackButton(true, animated: true)
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
        i = 0
        if usernameTxt.text != "" && passwordTxt.text != ""{
            while (usernameArray.count > i){
                if (usernameArray[i] == usernameTxt.text!)
                {
                    if passwordArray[i] == passwordTxt.text{
                        performSegue(withIdentifier: "toUserDetails", sender: nil)
                    }
                    else{
                        alertFunc(head: "Warning", content: "The password or username are wrong")
                    }
                }
                i = i + 1
            }
        }
        else{
            alertFunc(head: "Warning", content: "Please Enter Username or Password!")
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
                if let id = user.value(forKey: "id") as? UUID{
                    idArray.append(id)
                }
            }
            
        } catch {
            print("Warning! Data is not reload.")
        }
        
    }
 
    @IBAction func newAccount(_ sender: Any) {
        performSegue(withIdentifier: "loginToRegister", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUserDetails"{
            let destVC = segue.destination as! ViewControllerUserDetails
            i = 0
            while (usernameArray.count > i){
                if (usernameArray[i] == usernameTxt.text!)
                {
                    if passwordArray[i] == passwordTxt.text{
                        destVC.selectedUsername = usernameArray[i]
                        destVC.selectedID = idArray[i]
                    }
                }
                i = i + 1
            }
        }
    }
    
    @objc func alertFunc(head : String, content : String){
        let warnMessage = UIAlertController(title: head, message: content, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Okey", style: .default) { (UIAlertAction) in
        }
        warnMessage.addAction(okButton)
        self.present(warnMessage, animated: true, completion: nil)
    }
    
}
