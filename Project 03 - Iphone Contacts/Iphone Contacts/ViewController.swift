//
//  ViewController.swift
//  Iphone Contacts
//
//  Created by Yakup Acis on 8/16/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var groupsButton: UIButton!
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchTxt.textColor = UIColor.white
        tableView.separatorColor = UIColor.darkGray
        let color = UIColor.lightText
        searchTxt.attributedPlaceholder = NSAttributedString(string: searchTxt.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentView.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = "Test"
        cell.backgroundColor = UIColor.black
        return cell
    }
    

}

