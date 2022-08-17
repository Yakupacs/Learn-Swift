//
//  ViewControllerAddUser.swift
//  Iphone Contacts
//
//  Created by Yakup Acis on 8/17/22.
//

import UIKit
import CoreData

class ViewControllerAddUser: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addImage: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtCompany: UITextField!
    @IBOutlet weak var txtAddTelephone: UITextField!
    @IBOutlet weak var txtAddEmail: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var name : String = ""
    var surname : String = ""
    var id : UUID?
    var company : String = ""
    var telephone : Int32 = 0
    var email : String = ""
    var image : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 70
        imageView.layer.masksToBounds = true
        
        txtName.textColor = UIColor.white
        txtName.attributedPlaceholder =
        NSAttributedString(string: "Ad", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        txtSurname.textColor = UIColor.white
        txtSurname.attributedPlaceholder =
        NSAttributedString(string: "Soyad", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        txtCompany.textColor = UIColor.white
        txtCompany.attributedPlaceholder =
        NSAttributedString(string: "Şirket", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        txtAddTelephone.textColor = UIColor.white
        txtAddTelephone.attributedPlaceholder =
        NSAttributedString(string: "telefon ekle", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        txtAddEmail.textColor = UIColor.white
        txtAddEmail.attributedPlaceholder =
        NSAttributedString(string: "e-posta ekle", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        
        let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let image = UIImage(named: "plus")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .none

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: 40))
        view.addSubview(imageView)
        view.backgroundColor = .none
        
        txtAddTelephone.leftViewMode = UITextField.ViewMode.always
        txtAddTelephone.leftView = view

        
        let imageView2 = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let image2 = UIImage(named: "plus")
        imageView2.image = image2
        imageView2.contentMode = .scaleAspectFit
        imageView2.backgroundColor = .none

        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: 40))
        view2.addSubview(imageView2)
        view2.backgroundColor = .none
        
        txtAddEmail.leftViewMode = UITextField.ViewMode.always
        txtAddEmail.leftView = view2
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "toBack", sender: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        if txtName.text != "" || txtSurname.text != "" || txtCompany.text != "" || txtAddEmail.text != "" || txtAddTelephone.text != ""{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let contacts = NSEntityDescription.insertNewObject(forEntityName: "Contacts", into: context)
            
            contacts.setValue(txtName.text!, forKey: "name")
            contacts.setValue(txtSurname.text! , forKey: "surname")
            contacts.setValue(txtCompany.text!, forKey: "company")
            contacts.setValue(txtAddEmail.text!, forKey: "email")
            
            if let telephone = Int(txtAddTelephone.text!){
                contacts.setValue(telephone, forKey: "telephone")
            }
            
            contacts.setValue(UUID(), forKey: "id")
            
            let convertData = imageView.image!.jpegData(compressionQuality: 0.5)
            
            contacts.setValue(convertData, forKey: "image")
            
            do {
                try context.save()
                print("Registered")
            } catch{
                print("Error")
            }
            
            performSegue(withIdentifier: "toBack", sender: nil)
        }
        else{
            alertFunction(head: "Warning", content: "Please enter the user info!")
        }
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addPhoto(_ sender: Any) {
        selectImage()
    }
    
    @objc func alertFunction(head : String, content : String){
            let warnMessage = UIAlertController(title: head, message: content, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default) { (UIAlertAction) in
            }
            warnMessage.addAction(okButton)
            self.present(warnMessage, animated: true, completion: nil)
    }
    
}
