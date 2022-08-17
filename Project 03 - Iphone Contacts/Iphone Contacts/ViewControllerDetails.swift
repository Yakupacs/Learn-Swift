//
//  ViewControllerDetails.swift
//  Iphone Contacts
//
//  Created by Yakup Acis on 8/17/22.
//

import UIKit
import CoreData

class ViewControllerDetails: UIViewController {

    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnUpMessage: UIButton!
    @IBOutlet weak var btnDownMessage: UIButton!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnFacetime: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnTelephone: UIButton!
    @IBOutlet weak var txtNotes: UITextField!
    @IBOutlet weak var btnShareLocation: UIButton!
    @IBOutlet weak var btnEmergency: UIButton!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    var selectedName = ""
    var selectedID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnEmergency.layer.cornerRadius = 10
        btnTelephone.layer.cornerRadius = 10
        btnUpMessage.layer.cornerRadius = 10
        btnFacetime.layer.cornerRadius = 10
        btnEmail.layer.cornerRadius = 10
        btnCall.layer.cornerRadius = 10
        btnShareLocation.layer.cornerRadius = 10
        btnDownMessage.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 60
        btnFav.layer.cornerRadius = 10
        btnShare.layer.cornerRadius = 10
        txtNotes.placeholder = "Notlar"
        txtNotes.textColor = UIColor.white
        txtNotes.layer.backgroundColor = .init(red: 28, green: 28, blue: 29, alpha: 0.1)
        
        
        
        if selectedName != ""{
            
            
            // See fore data selected product info
            if let uuidString = selectedID?.uuidString{
                
                // if get UUID
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
                
                // Add Filter
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0{
                        
                        for result in results as! [NSManagedObject]{
                            
                            if let name = result.value(forKey: "name") as? String{
                                lblName.text = name
                            }
                            
                            if let telephone = result.value(forKey: "telephone") as? Int{
                                if telephone == 0{
                                    btnTelephone.isHidden = true
                                    btnFav.isHidden = true
                                    btnEmergency.isHidden =  true
                                    btnUpMessage.isEnabled = false
                                    btnCall.isEnabled = false
                                    btnFacetime.isEnabled = false
                                    btnEmail.isEnabled = false
                                    btnDownMessage.isHidden = true
                                    btnShareLocation.isHidden = true
                                    btnTelephone.setTitle("The number is not found", for: .normal)
                                    txtNotes.frame = CGRect(x: 15, y: 355, width: 380, height: 80)
                                    btnShare.frame = CGRect(x: 15, y: 445, width: 380, height: 50)
                                    
                                }
                                else{
                                    btnTelephone.isHidden = false
                                    btnTelephone.setTitle(String(telephone), for: .normal)
                                }
                            }
            
                            if let company = result.value(forKey: "company") as? String{
                                if company == ""{
                                    lblCompany.isHidden = true
                                }
                                else{
                                    lblCompany.isHidden = false
                                    lblCompany.text = company
                                }
                            }
                            
                            if let imageData = result.value(forKey: "image") as? Data{
                                let image = UIImage(data: imageData)
                                imageView.image = image
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
        performSegue(withIdentifier: "toBack2", sender: nil)
    }


}


extension UIButton {
    
    func centerVertically(padding: CGFloat = 6.0) {
        guard
            let imageViewSize = self.imageView?.frame.size,
            let titleLabelSize = self.titleLabel?.frame.size else {
            return
        }
        
        let totalHeight = imageViewSize.height + titleLabelSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageViewSize.height),
            left: 0.0,
            bottom: 0.0,
            right: -titleLabelSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageViewSize.width,
            bottom: -(totalHeight - titleLabelSize.height),
            right: 0.0
        )
        
        self.contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: titleLabelSize.height,
            right: 0.0
        )
    }
    
}
