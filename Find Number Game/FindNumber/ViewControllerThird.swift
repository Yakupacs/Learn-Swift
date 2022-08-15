//
//  ViewControllerThird.swift
//  FindNumber
//
//  Created by Yakup Acis on 8/8/22.
//

import UIKit

class ViewControllerThird: UIViewController {
    @IBOutlet weak var theCountLabel: UILabel!
    @IBOutlet weak var theNumber: UILabel!
    var GelenNumber = ""
    var GelenCount = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        theCountLabel.text = GelenCount
        theNumber.text = GelenNumber
    }
    
}
