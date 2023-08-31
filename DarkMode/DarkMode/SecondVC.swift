//
//  SecondVC.swift
//  DarkMode
//
//  Created by Yakup on 31.08.2023.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.tintColor = .white
    }
    

}
