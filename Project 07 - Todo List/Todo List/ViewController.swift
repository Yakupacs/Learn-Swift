//
//  ViewController.swift
//  Todo List
//
//  Created by Yakup Acis on 8/17/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var txtWhat: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var whatArray = [String]()
    var whenArray = [String]()
    var idArray = [UUID]()
    var time : String = ""
    let dateFormatter = DateFormatter()
    
    var what : String = ""
    var when : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .black
        tableView.contentSize = .init(width: 10, height: 10)
        
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        time = dateFormatter.string(from: datePicker.date)

        getDatas()
    }
    
    @IBAction func saveFunc(_ sender: Any) {
        if (txtWhat.text == ""){
            alertFunction(head: "Warning!", content: "Please enter the what are you going to do.")
        }
        else{
            time = dateFormatter.string(from: datePicker.date)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)
            
            todo.setValue(txtWhat.text, forKey: "what")
            todo.setValue(time, forKey: "when")
            todo.setValue(UUID(), forKey: "id")
            
            do {
                try context.save()
            } catch{
                alertFunction(head: "Error!", content: "The data is not saved!")
            }
            
        }
        getDatas()
        tableView.reloadData()
        txtWhat.text = ""
    }
    
    func getDatas(){
        
        whatArray.removeAll(keepingCapacity: false)
        whenArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let what = result.value(forKey: "what") as? String{
                        whatArray.append(what)
                    }
                    if let when = result.value(forKey: "when") as? String{
                        whenArray.append(when)
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        idArray.append(id)
                    }
                }
                tableView.reloadData()
            }
        } catch{
            alertFunction(head: "Warning!", content: "The data not found!")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(whatArray[indexPath.row]) -> (\(whenArray[indexPath.row]))"
        cell.contentView.backgroundColor = .systemTeal
        cell.backgroundColor = .systemTeal
        cell.textLabel?.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
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
                                whatArray.remove(at: indexPath.row)
                                whenArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                
                                self.tableView.reloadData()
                                
                                do {
                                    try context.save()
                                } catch{
                                    alertFunction(head: "Error!", content: "The data could not be deleted!")
                                }
                                
                                getDatas()
                                tableView.reloadData()
                                break
                            }
                        }
                        
                    }
                }
                
            } catch{
                alertFunction(head: "Error!", content: "The data could not be deleted!")
            }
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        what = whatArray[indexPath.row]
        when = whenArray[indexPath.row]
    }
    
    @objc func alertFunction(head: String, content: String){
        let warnMessage = UIAlertController(title: head, message: content, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Okey", style: .default) { (UIAlertAction) in
        }
        
        warnMessage.addAction(okButton)
        self.present(warnMessage, animated: true, completion: nil)
    }

}

