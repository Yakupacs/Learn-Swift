//
//  ViewControllerIntro.swift
//  Todo List
//
//  Created by Yakup Acis on 8/18/22.
//

import UIKit

class ViewControllerIntro: UIViewController {

    var timer = Timer()
    var time = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = 2
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(wait), userInfo: nil, repeats: true)
    }

    @objc func wait(){
        time = time - 1
        if (time == 0){
            timer.invalidate()
            time = 2
            performSegue(withIdentifier: "toTodoVC", sender: nil)
        }
    }

}
