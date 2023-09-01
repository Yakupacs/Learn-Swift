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
    }
    
    func isError() -> Bool
    {
        if (firstText.text != "" && secondText.text != "")
        {
            if let text1 = firstText.text, let text2 = secondText.text
            {
                if let _ = Double(text1), let _ = Double(text2)
                {
                    return false
                }
            }

        }
        resultLabel.text = "Error!"
        return true
    }

    @IBAction func btnAddition(_ sender: Any) {
        if (isError() == true)
        {
            return
        }
        if let firstNum = Double(firstText.text!){
            if let secondNum = Double(secondText.text!){
                resultLabel.text = String(firstNum + secondNum)
            }
        }
    }
    
    @IBAction func btnSub(_ sender: Any) {
        if (isError() == true)
        {
            return
        }
        if let firstNum = Double(firstText.text!){
            if let secondNum = Double(secondText.text!){
                resultLabel.text = String(firstNum - secondNum)
            }
        }
    }
    
    @IBAction func btnMultiple(_ sender: Any) {
        if (isError() == true)
        {
            return
        }
        if let firstNum = Double(firstText.text!){
            if let secondNum = Double(secondText.text!){
                resultLabel.text = String(firstNum * secondNum)
            }
        }
    }
    
    @IBAction func btnDivision(_ sender: Any) {
        if (isError() == true)
        {
            return
        }
        if let firstNum = Double(firstText.text!){
            if let secondNum = Double(secondText.text!){
                resultLabel.text = String(firstNum / secondNum)
            }
        }
    }
    

}

