//
//  ViewControllerUserDetails.swift
//  LoginPage
//
//  Created by Yakup Acis on 8/13/22.
//

import UIKit


class ViewControllerUserDetails: UIViewController {
    

    var username = ""
    var password = ""

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!

    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        surnameLabel.text = ""
        ageLabel.text = ""
        telephoneLabel.text = ""
        usernameLabel.text = username
        passwordLabel.text = password
    }

}
