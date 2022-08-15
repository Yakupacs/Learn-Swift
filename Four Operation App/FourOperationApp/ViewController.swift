//
//  ViewController.swift
//  FourOperationApp
//
//  Created by Yakup Acis on 8/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var sonuc = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAddition(_ sender: Any) {
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                resultLabel.text = String(firstNum + secondNum)
            }
        }
    }
    
    @IBAction func btnSub(_ sender: Any) {
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                resultLabel.text = String(firstNum - secondNum)
            }
        }
    }
    
    @IBAction func btnMultiple(_ sender: Any) {
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                resultLabel.text = String(firstNum * secondNum)
            }
        }
    }
    
    @IBAction func btnDivision(_ sender: Any) {
        if let firstNum = Int(firstText.text!){
            if let secondNum = Int(secondText.text!){
                resultLabel.text = String(firstNum / secondNum)
            }
        }
    }
    

}

