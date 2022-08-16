//
//  ViewControllerList.swift
//  Maps App
//
//  Created by Yakup Acis on 8/16/22.
//

import UIKit
import CoreData

class ViewControllerList: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var sendLocationName = ""
    var sendLocationID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Table View Self
        tableView.delegate = self
        tableView.dataSource = self
        
        // Right Bar Button Item
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        
        // Get Data
        getDatas()
    }
    
    // Get Data Refreshed
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getDatas), name: NSNotification.Name("newLocationCreated"), object: nil)
    }
    
    // Get Map Datas
    @objc func getDatas(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Location")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0{
                
                nameArray.removeAll(keepingCapacity: false)
                idArray.removeAll(keepingCapacity: false)
                
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String{
                        nameArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID{
                        idArray.append(id)
                    }
                }
                
                tableView.reloadData()
                
            }
        } catch{
            print("Error")
        }
    }
    
    // Add Button Click Function
    @objc func addButtonClick(){
        sendLocationName = ""
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    // Table View Row Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idArray.count
    }
    
    // Table View Names On Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    // Table View Datas Send To "toMapVC" ViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendLocationName = nameArray[indexPath.row]
        sendLocationID = idArray[indexPath.row
        ]
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    // Prepare Send Datas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapVC"{
            let destVC = segue.destination as! MapsViewController
            destVC.selectedName = sendLocationName
            destVC.selectedID = sendLocationID
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete{
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Location")
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
