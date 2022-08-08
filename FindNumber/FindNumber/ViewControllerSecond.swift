//
//  ViewControllerSecond.swift
//  FindNumber
//
//  Created by Yakup Acis on 8/8/22.
//

import UIKit

class ViewControllerSecond: UIViewController {

    @IBOutlet weak var passwdLabel: UILabel!
    var GelenSayi = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwdLabel.text = GelenSayi
    }


}
