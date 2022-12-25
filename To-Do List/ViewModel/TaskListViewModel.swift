//
//  TaskListViewModel.swift
//  To-Do List
//
//  Created by Chethan J on 11/12/2022.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    @Published var tasks: [TaskModel] = []
    
    func retrieveTasks() {
        tasks = TaskServiceUserDefaults.sharedInstance.retrieve()
    }

    func addTask(_ task: TaskModel) {
        TaskServiceUserDefaults.sharedInstance.saveTask(model: task)
        retrieveTasks()
    }

    func removeTask(at index: Int) {
        self.tasks.remove(at: index)
        TaskServiceUserDefaults.sharedInstance.delete(index: index, tasks: self.tasks)
    }

    func updateTask(at index: Int, with task: TaskModel) {
        tasks[index] = task
    }
}

