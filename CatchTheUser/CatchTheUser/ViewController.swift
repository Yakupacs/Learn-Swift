//
//  ViewController.swift
//  CatchTheUser
//
//  Created by Yakup Acis on 8/15/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var yournameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startGame(_ sender: Any) {
        if yournameTxt.text != ""{
            performSegue(withIdentifier: "toGame", sender: nil)
        }
        else{
            alertFunction(head: "Warning!", content: "Please enter your name!")
        }
    }
    
    @IBAction func allScoresButton(_ sender: Any) {
        performSegue(withIdentifier: "toScores", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame"{
            let destVC = segue.destination as! ViewControllerGame
            destVC.getName = yournameTxt.text!
        }
    }
    
    @objc func alertFunction(head : String, content : String){
        let warnMessage = UIAlertController(title: head, message: content, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default) { (UIAlertAction) in
        }
        warnMessage.addAction(okButton)
        self.present(warnMessage, animated: true, completion: nil)
    }
}

