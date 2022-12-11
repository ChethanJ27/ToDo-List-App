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

    @Published private(set) var tasks: [Task] = [Task(title: "1", createdAt: Date(), completed: false),Task(title: "String", createdAt: Date(), completed: true)]

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }

    func updateTask(at index: Int, with task: Task) {
        tasks[index] = task
    }
}

