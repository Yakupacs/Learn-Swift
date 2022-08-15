//
//  ViewControllerGame.swift
//  CatchTheUser
//
//  Created by Yakup Acis on 8/15/22.
//

import UIKit
import CoreData

class ViewControllerGame: UIViewController {

    
    @IBOutlet weak var catchMeLabel: UILabel!
    @IBOutlet weak var imageViewA1: UIImageView!
    @IBOutlet weak var imageViewA2: UIImageView!
    @IBOutlet weak var imageViewA3: UIImageView!
    @IBOutlet weak var imageViewA4: UIImageView!
    @IBOutlet weak var imageViewB1: UIImageView!
    @IBOutlet weak var imageViewB2: UIImageView!
    @IBOutlet weak var imageViewB3: UIImageView!
    @IBOutlet weak var imageViewB4: UIImageView!
    @IBOutlet weak var imageViewC1: UIImageView!
    @IBOutlet weak var imageViewC2: UIImageView!
    @IBOutlet weak var imageViewC3: UIImageView!
    @IBOutlet weak var imageViewC4: UIImageView!
    @IBOutlet weak var imageViewD1: UIImageView!
    @IBOutlet weak var imageViewD2: UIImageView!
    @IBOutlet weak var imageViewD3: UIImageView!
    @IBOutlet weak var imageViewD4: UIImageView!
    @IBOutlet weak var yourScoreLabel: UILabel!

    
    var timer = Timer()
    var myTime = 0
    var myTime2 = 0
    var array = [UIImageView]()
    var selectedImage : UIImageView?
    var score = 0
    var getName : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        catchMeLabel.text = "Catch Me \(getName)"
        yourScoreLabel.text = "Your Score: \(score)"
        
        array.append(imageViewA1)
        array.append(imageViewA2)
        array.append(imageViewA3)
        array.append(imageViewA4)
        array.append(imageViewB1)
        array.append(imageViewB2)
        array.append(imageViewB3)
        array.append(imageViewB4)
        array.append(imageViewC1)
        array.append(imageViewC2)
        array.append(imageViewC3)
        array.append(imageViewC4)
        array.append(imageViewD1)
        array.append(imageViewD2)
        array.append(imageViewD3)
        array.append(imageViewD4)
        
        imageViewA1.isUserInteractionEnabled = true
        imageViewA2.isUserInteractionEnabled = true
        imageViewA3.isUserInteractionEnabled = true
        imageViewA4.isUserInteractionEnabled = true
        imageViewB1.isUserInteractionEnabled = true
        imageViewB2.isUserInteractionEnabled = true
        imageViewB3.isUserInteractionEnabled = true
        imageViewB4.isUserInteractionEnabled = true
        imageViewC1.isUserInteractionEnabled = true
        imageViewC2.isUserInteractionEnabled = true
        imageViewC3.isUserInteractionEnabled = true
        imageViewC4.isUserInteractionEnabled = true
        imageViewD1.isUserInteractionEnabled = true
        imageViewD2.isUserInteractionEnabled = true
        imageViewD3.isUserInteractionEnabled = true
        imageViewD4.isUserInteractionEnabled = true
        
        imageViewA1.isHidden = true
        imageViewA2.isHidden = true
        imageViewA3.isHidden = true
        imageViewA4.isHidden = true
        imageViewB1.isHidden = true
        imageViewB2.isHidden = true
        imageViewB3.isHidden = true
        imageViewB4.isHidden = true
        imageViewC1.isHidden = true
        imageViewC2.isHidden = true
        imageViewC3.isHidden = true
        imageViewC4.isHidden = true
        imageViewD1.isHidden = true
        imageViewD2.isHidden = true
        imageViewD3.isHidden = true
        imageViewD4.isHidden = true
        
        myTime = 60
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(startFunc), userInfo: nil, repeats: true)
    }

    @objc func startFunc(){
        myTime = myTime - 1
        selectedImage?.isUserInteractionEnabled = true
        let gestureRecog = UITapGestureRecognizer(target: self, action: #selector(countScore))
        selectedImage?.addGestureRecognizer(gestureRecog)
        selectedImage?.isHidden = true
        array.shuffle()
        selectedImage = array[0]
        selectedImage?.isHidden = false

        if myTime == 0{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let scoree = NSEntityDescription.insertNewObject(forEntityName: "Scores", into: context)
            
            scoree.setValue(getName, forKey: "username")
            scoree.setValue(score, forKey: "score")
            
            // Universal unique id
            scoree.setValue(UUID(), forKey: "id")
            
            do{
                try context.save()
                print("Registered.")
            } catch{
                print("Error")
            }
            
            alertFunction(head: "Time is up!", content: "Your score is \(score)")
            imageViewA1.isUserInteractionEnabled = false
            imageViewA2.isUserInteractionEnabled = false
            imageViewA3.isUserInteractionEnabled = false
            imageViewA4.isUserInteractionEnabled = false
            imageViewB1.isUserInteractionEnabled = false
            imageViewB2.isUserInteractionEnabled = false
            imageViewB3.isUserInteractionEnabled = false
            imageViewB4.isUserInteractionEnabled = false
            imageViewC1.isUserInteractionEnabled = false
            imageViewC2.isUserInteractionEnabled = false
            imageViewC3.isUserInteractionEnabled = false
            imageViewC4.isUserInteractionEnabled = false
            imageViewD1.isUserInteractionEnabled = false
            imageViewD2.isUserInteractionEnabled = false
            imageViewD3.isUserInteractionEnabled = false
            imageViewD4.isUserInteractionEnabled = false
            timer.invalidate()
            imageViewA1.isHidden = true
            imageViewA2.isHidden = true
            imageViewA3.isHidden = true
            imageViewA4.isHidden = true
            imageViewB1.isHidden = true
            imageViewB2.isHidden = true
            imageViewB3.isHidden = true
            imageViewB4.isHidden = true
            imageViewC1.isHidden = true
            imageViewC2.isHidden = true
            imageViewC3.isHidden = true
            imageViewC4.isHidden = true
            imageViewD1.isHidden = true
            imageViewD2.isHidden = true
            imageViewD3.isHidden = true
            imageViewD4.isHidden = true
        }
    }
    
    @objc func countScore(){
        array.shuffle()
        selectedImage = array[0]
        imageViewA1.isHidden = true
        imageViewA2.isHidden = true
        imageViewA3.isHidden = true
        imageViewA4.isHidden = true
        imageViewB1.isHidden = true
        imageViewB2.isHidden = true
        imageViewB3.isHidden = true
        imageViewB4.isHidden = true
        imageViewC1.isHidden = true
        imageViewC2.isHidden = true
        imageViewC3.isHidden = true
        imageViewC4.isHidden = true
        imageViewD1.isHidden = true
        imageViewD2.isHidden = true
        imageViewD3.isHidden = true
        imageViewD4.isHidden = true
        selectedImage?.isHidden = false
        score = score + 1
        yourScoreLabel.text = "Your Score: \(score)"
    }
    
    @IBAction func resetButton(_ sender: Any) {
        imageViewA1.isHidden = true
        imageViewA2.isHidden = true
        imageViewA3.isHidden = true
        imageViewA4.isHidden = true
        imageViewB1.isHidden = true
        imageViewB2.isHidden = true
        imageViewB3.isHidden = true
        imageViewB4.isHidden = true
        imageViewC1.isHidden = true
        imageViewC2.isHidden = true
        imageViewC3.isHidden = true
        imageViewC4.isHidden = true
        imageViewD1.isHidden = true
        imageViewD2.isHidden = true
        imageViewD3.isHidden = true
        imageViewD4.isHidden = true
        myTime = 60
        score = 0
        yourScoreLabel.text = "Your Score: \(score)"
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(startFunc), userInfo: nil, repeats: true)
        selectedImage = nil
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "toBack", sender: nil)
    }
    @objc func alertFunction(head : String, content : String){
        let warnMessage = UIAlertController(title: head, message: content, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default) { (UIAlertAction) in
        }
        warnMessage.addAction(okButton)
        self.present(warnMessage, animated: true, completion: nil)
    }
}
