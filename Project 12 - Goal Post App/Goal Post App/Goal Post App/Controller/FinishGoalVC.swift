//
//  FinishGoalVC.swift
//  Goal Post App
//
//  Created by Yakup on 1.01.2023.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type 
    }

    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != ""{
            self.save { (complete) in
                if complete{
                    dismiss(animated: true,completion: nil)
                }
            }
        }

    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            completion(true)
            print("Successfully saved data.")
        }catch{
            print(debugPrint("Could not save: \(error.localizedDescription)"))
            completion(false)
        }
        
    }
}
