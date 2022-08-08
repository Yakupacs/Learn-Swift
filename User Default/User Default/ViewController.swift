//
//  ViewController.swift
//  Userr
//
//  Created by Yakup Acis on 8/8/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtNote: UITextField!
    override func viewDidLoad() {
        let savedNot = UserDefaults.standard.object(forKey: "note")
        let savedTime = UserDefaults.standard.object(forKey: "time")
        // as -> casting
        if let getNote = savedNot as? String {
            workLabel.text = "Work to do: \(getNote)"
        }
        if let getTime = savedTime as? String {
            timeLabel.text = "Time to do: \(getTime)"
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveClick(_ sender: Any) {
        UserDefaults.standard.set(txtNote.text, forKey: "note")
        UserDefaults.standard.set(txtDate.text, forKey: "time")
        workLabel.text = "Work to do: \(txtNote.text!)"
        timeLabel.text = "Time to do: \(txtDate.text!)"
    }
    
    @IBAction func clearClick(_ sender: Any) {

        workLabel.text = "Work to do:"
        timeLabel.text = "Time to do:"
    }
    
}

