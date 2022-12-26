//
//  TaskCell.swift
//  To-Do List
//
//  Created by Chethan J on 11/12/2022.
//

import Foundation
import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var checkMarkBtn: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupBtnImage(completed:Bool) {
        if completed {
            checkMarkBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checkMarkBtn.configuration?.baseForegroundColor = UIColor.tintColor
        } else {
            checkMarkBtn.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            checkMarkBtn.configuration?.baseForegroundColor = UIColor.red
        }
    }
}
