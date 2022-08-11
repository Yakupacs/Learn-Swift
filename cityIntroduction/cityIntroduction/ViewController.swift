//
//  ViewController.swift
//  cityIntroduction
//
//  Created by Yakup Acis on 8/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cityArray = [City]()
    var userChecked : City?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
     
        // Cities
        
        let istanbul = City(name: "Istanbul", region: "Marmara", image: UIImage(named: "istanbul")!)
        let ankara = City(name: "Ankara", region: "Central Anatolia", image: UIImage(named: "ankara")!)
        let izmir = City(name: "Izmir", region: "Aegean", image: UIImage(named: "izmir")!)
        let adana = City(name: "Adana", region: "Southeastern", image: UIImage(named: "adana")!)
        let trabzon = City(name: "Trabzon", region: "Black Sea", image: UIImage(named: "trabzon")!)
        
        cityArray = [istanbul,ankara,izmir,adana,trabzon]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cityArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userChecked = cityArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destVC = segue.destination as! ViewControllerDetails
            destVC.selectedCity = userChecked
        }
    }
    
}

