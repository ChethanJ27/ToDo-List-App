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

    var viewModel: TaskListViewModel!
    private var cancellables = Set<AnyCancellable>()
    var count = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        // Bind the tasks property of the view model to the table view
        viewModel.$tasks
            .sink { [weak self] tasks in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    @IBAction func addTask(_ sender: Any) {
        count+=1
        viewModel.addTask(Task(title: "\(count)", createdAt: Date(), completed: false))
    }
    
}

extension TaskListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        let task = viewModel.tasks[indexPath.row]

        cell.titleLabel.text = task.title
        cell.dueDateLabel.text = "\(task.createdAt)"

        return cell
    }
}

extension TaskListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = viewModel.tasks[indexPath.row]
        // Show the detail view for the selected task
    }
}
