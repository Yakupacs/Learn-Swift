//
//  ViewControllerRegister.swift
//  LoginPage
//
//  Created by Yakup Acis on 8/13/22.
//

import UIKit
import CoreData

class ViewControllerRegister: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Definition Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var surnameTxt: UITextField!
    @IBOutlet weak var telephoneTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var password2Txt: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Click to imageView
        imageView.isUserInteractionEnabled = true
        let imageGestRecog = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageGestRecog)
        
    }
    
    
    // Click to imageView Function
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    //Show editedImage on imageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // User info add Coredata
    @IBAction func registerFunc(_ sender: Any) {
        
        if nameTxt.text != "" && surnameTxt.text != "" && telephoneTxt.text != "" && ageTxt.text != "" && usernameTxt.text != "" && passwordTxt.text != "" && password2Txt.text != ""
        {
        
            if passwordTxt.text == password2Txt.text{
                
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                let userData = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
                
                userData.setValue(UUID(), forKey: "id")
                userData.setValue(nameTxt.text!, forKey: "name")
                userData.setValue(surnameTxt.text!, forKey: "surname")
                userData.setValue(usernameTxt.text!, forKey: "username")
                userData.setValue(passwordTxt.text!, forKey: "password")
                let imageData = imageView.image!.jpegData(compressionQuality: 0.5)
                userData.setValue(imageData, forKey: "image")
                if let telephone = Int(telephoneTxt.text!){
                    userData.setValue(telephone, forKey: "telephone")
                }
                if let age = Int(ageTxt.text!){
                    userData.setValue(age, forKey: "age")
                }
                
                
                do {
                    try context.save()
                    print("Success! The data is saved!")
                } catch{
                    print("Fail! The data is not saved!")
                }
                
                
            }

            
            
        }

    }
    

    
    
}
