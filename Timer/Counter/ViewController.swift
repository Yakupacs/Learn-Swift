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
    var sign = 0
    var myTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTime = 5
        lblTime.text = "Time: \(myTime)"
    }

    @IBAction func Start(_ sender: Any) {
        if (sign == 0)
        {
            lblTime.text = "Time: \(myTime)"
            sign = 1
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerFunction(){
        myTime = myTime - 1
        lblTime.text = "Time: \(myTime)"
        
        if myTime == 0 {
            myTime = 5
            lblTime.text = "Time is up!"
            sign = 0
            timer.invalidate()
        }
    }
    
}

