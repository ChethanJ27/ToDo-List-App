//
//  TaskListVC.swift
//  To-Do List
//
//  Created by Chethan J on 11/12/2022.
//

import UIKit
import Foundation
import Combine

class TaskListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBtn: UIButton!
    
    var viewModel: TaskListViewModel!
    private var cancellables = Set<AnyCancellable>()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.layer.cornerRadius = 23
        viewModel.retrieveTasks()
        tableView.dataSource = self
        tableView.delegate = self
        // Bind the tasks property of the view model to the table view
        viewModel.$tasks
            .sink { [weak self] tasks in
                self?.count = tasks.count
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    @IBAction func addTask(_ sender: Any) {
        let alertController = UIAlertController(title: "Add New Task", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField
        {
            (textField : UITextField!) -> Void in
            textField.placeholder = "Enter here"
            textField.autocorrectionType = .yes
            textField.autocapitalizationType = UITextAutocapitalizationType.sentences
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let title = alertController.textFields?[0].text
            if title != nil && title != "" {
                let task: TaskModel = self.viewModel.createTask(name: title!, completed: false, createdAt: Date())
                self.viewModel.addTask(task)
            }
            else
            {
                self.dismiss(animated: false, completion: nil)
            }
        })
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler:
                                            {
            (action : UIAlertAction!) -> Void in
            self.dismiss(animated: false, completion: nil)
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension TaskListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        let task = viewModel.tasks[indexPath.row]
        
        cell.titleLabel.text = task.title
        
        return cell
    }
}

extension TaskListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = viewModel.tasks[indexPath.row]
        // Show the detail view for the selected task
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete", handler: {(action,view,completionHandler) in
            self.viewModel.removeTask(at: indexPath.row)
        })
        return UISwipeActionsConfiguration(actions: [action])
    }
}
