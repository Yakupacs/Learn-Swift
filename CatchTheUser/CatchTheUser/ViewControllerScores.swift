//
//  ViewControllerScores.swift
//  CatchTheUser
//
//  Created by Yakup Acis on 8/15/22.
//

import UIKit
import CoreData

class ViewControllerScores: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var scoreArray = [Int]()
    
    var selectedName = ""
    var selectedUUID : UUID?
    var selectedScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDatas()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(nameArray[indexPath.row]) = \(scoreArray[indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    @objc func getDatas(){

            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "username") as? String{
                            nameArray.append(name)
                        }
                        if let id = result.value(forKey: "id") as? UUID{
                            idArray.append(id)
                        }
                        if let score = result.value(forKey: "score") as? Int{
                            scoreArray.append(score)
                        }
                    }
                    
                    tableView.reloadData()
                }
            } catch{
                print("Error")
            }
            
        }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "backHome", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
            let uuidString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0{
                    
                    for result in results as! [NSManagedObject]{
                        
                        if let id = result.value(forKey: "id") as? UUID{
                            if id == idArray[indexPath.row]{
                                
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                scoreArray.remove(at: indexPath.row)
                                
                                self.tableView.reloadData()
                                
                                do {
                                    try context.save()
                                } catch{
                                    print("Error")
                                }

                                break
                            }
                        }
                    }
                }
            } catch{
                print("Error")
            }
        }
    }
}
