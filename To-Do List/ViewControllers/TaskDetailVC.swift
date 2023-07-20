//
//  TaskDetailVC.swift
//  To-Do List
//
//  Created by Chethan J on 26/12/2022.
//

import UIKit

class TaskDetailVC: UIViewController {
    
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var toggleBtn: UISwitch!
    
    
    var currentTask: TaskModel!
    var taskCompleted: Bool!
    var index: Int!
    var viewModel: TaskListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.alpha = 0.379999995231628
        taskTitle.text = currentTask.title
        taskCompleted = currentTask.completed
        toggleBtn.setOn(taskCompleted!, animated: true)
    }
    
    @IBAction func toggledTaskCompleted(_ sender: Any) {
        
        taskCompleted = !(taskCompleted)
        toggleBtn.setOn(taskCompleted!, animated: true)
        
    }
    
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        
        self.dismiss(animated: false)
    }
    
    @IBAction func updateBtnClicked(_ sender: Any) {
        currentTask.title = taskTitle.text
        currentTask.completed = taskCompleted ?? false
        
        viewModel.updateTask(at: index, with: currentTask)
        self.dismiss(animated: false)
    }
    
    
}
