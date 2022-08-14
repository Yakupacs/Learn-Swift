//
//  ViewController.swift
//  LoginPage
//
//  Created by Yakup Acis on 8/13/22.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var myTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTime = 1
        timerStart()

    }
    
    @objc func timerStart(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(function), userInfo: nil, repeats: true)
    }
    
    @objc func function(){
        myTime = myTime - 1
        if myTime == 0{
            timer.invalidate()
            performSegue(withIdentifier: "toLogin", sender: nil)
        }
    }
    
}

