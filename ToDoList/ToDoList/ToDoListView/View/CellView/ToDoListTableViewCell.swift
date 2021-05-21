//
//  ToDoListTableViewCell.swift
//  ToDoList
//
//  Created by VTVH on 5/21/21.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
