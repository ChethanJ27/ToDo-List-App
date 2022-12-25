//
//  TaskCell.swift
//  To-Do List
//
//  Created by Chethan J on 11/12/2022.
//

import Foundation
import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    var viewModel: TaskListViewModel = TaskListViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.$tasks
            .sink { [weak self] tasks in
                print(tasks)
            }
    }
}
