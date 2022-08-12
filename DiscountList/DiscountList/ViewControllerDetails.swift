//
//  ViewControllerDetails.swift
//  DiscountList
//
//  Created by Yakup Acis on 8/11/22.
//

import UIKit
import CoreData

class ViewControllerDetails: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var productTrademark: UITextField!
    @IBOutlet weak var productLocation: UITextField!
    @IBOutlet weak var productSize: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Click to screen
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keywordClose))
        view.addGestureRecognizer(gestureRecognizer)
        
        // Click to imageView
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    }
    
    @objc func keywordClose(){
        // Keyword close
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        // Selected Image forward photoLibrary and editing
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let shopping = NSEntityDescription.insertNewObject(forEntityName: "Shopping", into: context)
        
        shopping.setValue(productName.text!, forKey: "name")
        shopping.setValue(productSize.text!, forKey: "size")
        shopping.setValue(productTrademark.text!, forKey: "trademark")
        shopping.setValue(productLocation.text!, forKey: "location")
        
        if let price = Int(productPrice.text!){
            shopping.setValue(price, forKey: "price")
        }
        
        // Universal unique id
        shopping.setValue(UUID(), forKey: "id")
        
        let convertData = imageView.image!.jpegData(compressionQuality: 0.5)
        
        shopping.setValue(convertData, forKey: "image")
        
        do{
            try context.save()
            print("Registered.")
        } catch{
            print("Error")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Show editedImage on imageView
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
}
