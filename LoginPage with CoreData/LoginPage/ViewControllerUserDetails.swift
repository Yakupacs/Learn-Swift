//
//  ViewControllerUserDetails.swift
//  LoginPage
//
//  Created by Yakup Acis on 8/13/22.
//

import UIKit
import CoreData

class ViewControllerUserDetails: UIViewController {

    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!

    
    var selectedID : UUID?
    var selectedName = ""
    var selectedUsername = ""
    var selectedPassword = ""
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if selectedUsername != ""{
            
            // See fore data selected product info
            if let uuidString = selectedID?.uuidString{
                
                // if get UUID
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
                
                // Add Filter
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0 {
                        
                        for result in results as! [NSManagedObject]{
                            
                            if let name = result.value(forKey: "name") as? String{
                                nameLabel.text = name
                            }
                            
                            if let surname = result.value(forKey: "surname") as? String{
                                surnameLabel.text = surname
                            }
                            
                            if let size = result.value(forKey: "telephone") as? Int{
                                telephoneLabel.text = String(size)
                            }
                            
                            if let location = result.value(forKey: "username") as? String{
                                usernameLabel.text = location
                            }
                            
                            if let trademark = result.value(forKey: "password") as? String{
                                passwordLabel.text = trademark
                            }
                                
                            if let age = result.value(forKey: "age") as? Int{
                                ageLabel.text = String(age)
                            }
                            
                            if let imageData = result.value(forKey: "image") as? Data{
                                let image = UIImage(data: imageData)
                                ImageView.image = image
                            }
                        }
                        
                    }
                    
                } catch{
                    print("Error")
                }
                
            }
            
        }
    }
    @IBAction func btnBack(_ sender: Any) {
        performSegue(withIdentifier: "backToLogin", sender: nil)
    }
}
