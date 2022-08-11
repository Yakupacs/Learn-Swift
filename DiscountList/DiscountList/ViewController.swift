//
//  ViewController.swift
//  DiscountList
//
//  Created by Yakup Acis on 8/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClick))
        
    }

    @objc func addButtonClick(){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
}

