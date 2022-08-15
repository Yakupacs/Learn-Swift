//
//  ViewController.swift
//  codeAppearance
//
//  Created by Yakup Acis on 8/6/22.
//

import UIKit

class ViewController: UIViewController {

    var toplam = 0
    let countButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        let maxWidth = view.frame.size.width
        let maxHeight = view.frame.size.height
        
        // Label
        
        //let myLabel = UILabel()
        //myLabel.text = "Test Label"
        //myLabel.textAlignment = .center
        //myLabel.frame = CGRect(x: maxWidth * 0.5 - 50, y: maxHeight * 0.5 - 50, width: 100, height: 100)
        //view.addSubview(myLabel)
        
        // Button
        
        let myButton = UIButton()
        myButton.setTitle("Increment Count", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        myButton.frame = CGRect(x: maxWidth * 0.5 - 75, y: maxHeight * 0.5, width: 150, height: 40)
        myButton.layer.cornerRadius = 10
        myButton.backgroundColor = UIColor.white
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myFunc), for: UIControl.Event.touchUpInside)
        
        countButton.setTitle(String(toplam), for: UIControl.State.normal)
        countButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        countButton.backgroundColor = UIColor.red
        countButton.frame = CGRect(x: maxWidth * 0.5 - 25, y: maxHeight * 0.40, width: 50, height: 50)
        countButton.layer.cornerRadius = 25
        view.addSubview(countButton)
    }
    
    @IBAction func myFunc(){
        toplam += 1
        countButton.setTitle(String(toplam), for: UIControl.State.normal)
    }
}

