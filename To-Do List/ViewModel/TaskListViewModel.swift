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
    
    let serviceApi = ServiceManager.sharedInstance

    @Published var tasks: [TaskModel] = []
    
    func createTask(name:String,completed: Bool, createdAt: Date) -> TaskModel {
        return serviceApi.createTask(name: name, completed: completed, createdAt: createdAt)
    }
    
    func retrieveTasks() {
        tasks = serviceApi.retrieve()
    }

    func addTask(_ task: TaskModel) {
        serviceApi.saveTask(model: task)
        retrieveTasks()
    }

    func removeTask(at index: Int) {
        self.tasks.remove(at: index)
        serviceApi.delete(index: index, tasks: self.tasks)
    }

    func updateTask(at index: Int, with task: TaskModel) {
        tasks[index] = task
    }
}

