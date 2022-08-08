//
//  ViewController.swift
//  FindNumber
//
//  Created by Yakup Acis on 8/8/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var sayiGirTxt: UITextField!
    @IBOutlet weak var gonderButton: UIButton!
    
    var count = 5
    var number = Int.random(in: 0 ... 20)
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLbl.text = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func gonderButton(_ sender: Any) {
        performSegue(withIdentifier: "secondScreen", sender: nil)
    }
    @IBAction func anotherPage(_ sender: Any) {
        performSegue(withIdentifier: "thirdScreen", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondScreen"{
            let destinationVC = segue.destination as! ViewControllerSecond
            
            destinationVC.GelenSayi = String(number)
        }
        if segue.identifier == "thirdScreen"{
            let destinationVC3 = segue.destination as! ViewControllerThird
            
            destinationVC3.GelenCount = String(count)
            destinationVC3.GelenNumber = String(number)
        }
    }
    @IBAction func btnSend(_ sender: Any) {
        if (sayiGirTxt.text == String(number)){
            resultLbl.text = "Succesfully!"
            view.backgroundColor = UIColor.green
        }
        else if (count == 0){
            resultLbl.text = "Game Over!"
            view.backgroundColor = UIColor.red
            gonderButton.isHidden = true
            sayiGirTxt.isHidden = true
        }
        else{
            count -= 1
            resultLbl.text = "Try Again!"
        }
    }
    @IBAction func btnRetry(_ sender: Any) {
        count = 5
        number = Int.random(in: 0 ... 20)
        resultLbl.text = ""
        view.backgroundColor = UIColor.white
        gonderButton.isHidden = false
        sayiGirTxt.isHidden = false
        sayiGirTxt.text = ""
    }

    
    
}

