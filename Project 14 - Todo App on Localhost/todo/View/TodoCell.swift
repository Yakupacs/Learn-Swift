//
//  TodoCell.swift
//  todo
//
//  Created by Yakup on 21.01.2023.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    
    func updateCell(todo: Todo){
        itemLabel.text = todo.item
        priorityView.layer.cornerRadius = 17
        
        switch todo.priority{
        case 0:
            priorityView.backgroundColor = .yellow
            break
        case 1:
            priorityView.backgroundColor = .orange
            break
        default:
            priorityView.backgroundColor = .red
            break
        }
    }
}
