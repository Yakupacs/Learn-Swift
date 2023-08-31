//
//  ViewController.swift
//  DarkMode
//
//  Created by Yakup on 31.08.2023.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if (userInterfaceStyle == .dark)
        {
            changeButton.tintColor = .white
        }
        else
        {
            changeButton.tintColor = .systemBlue
        }
    }
}

