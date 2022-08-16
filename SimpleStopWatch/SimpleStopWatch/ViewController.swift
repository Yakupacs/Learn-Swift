//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Yakup Acis on 8/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    var myTime : Float = 0.0
    var sign : Bool = true
    var firstPress : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let playImage = UIImage(named: "playButton") as UIImage?
        playButton.setImage(playImage, for: .normal)
        playButton.imageView?.contentMode = .scaleAspectFit
        
        let pauseImage = UIImage(named: "pauseButton") as UIImage?
        pauseBtn.setImage(pauseImage, for: .normal)
        pauseBtn.imageView?.contentMode = .scaleAspectFit
        
        let stopImage = UIImage(named: "stopButton") as UIImage?
        stopButton.setImage(stopImage, for: .normal)
        stopButton.imageView?.contentMode = .scaleAspectFill
        
    }

    @IBAction func startTime(_ sender: Any) {
        if (sign == false)
        {
            sign = true
        }
        else if(firstPress == false){
            Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countFunc), userInfo: nil, repeats: true)
            firstPress = true
            }
    }
    
    @objc func countFunc(){
        if (sign == false){
            timer.invalidate()
        }
        else{
            myTime = myTime + 0.01
            
            timeLabel.text = String(format: "%.2f", myTime)
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        sign = false
    }
    
    @IBAction func stopButton(_ sender: Any) {
        sign = false
        timer.invalidate()
        myTime = 0.0
        firstPress = false
        timeLabel.text = String(format: "%.2f", myTime)
    }
}

