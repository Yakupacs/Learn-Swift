//
//  ViewController.swift
//  Counter
//
//  Created by Yakup Acis on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var lblTime: UILabel!
    
    var timer = Timer()
    var myTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTime = 15
        lblTime.text = "Time: \(myTime)"
    }

    @IBAction func Start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction(){
        lblTime.text = "Time: \(myTime)"
        myTime = myTime - 1
        
        if myTime == 0 {
            myTime = 15
            lblTime.text = "Time is up!"
            timer.invalidate()
        }
    }
    
}

