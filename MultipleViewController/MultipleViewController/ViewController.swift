//
//  ViewController.swift
//  MultipleViewController
//
//  Created by Yakup Acis on 8/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var firstScreenGoTo: UIButton!
    @IBOutlet weak var firstScreenLabel: UILabel!
    var alinanSifre = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func control(_ sender: Any) {
        alinanSifre = passwordTextBox.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.verilenSifre = alinanSifre
        }
    }
}

