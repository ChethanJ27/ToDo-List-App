//
//  TasksServiceCoreData.swift
//  To-Do List
//
//  Created by Chethan J on 25/12/2022.
//

import Foundation
import UIKit

class TasksServiceCoreData: TaskService {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveTask(model: TaskModel) {
        try! context.save()
    }
    
    func delete(index: Int, tasks: [TaskModel]) {
        let taskToremove: TasksCoreData = tasks[index] as! TasksCoreData
        context.delete(taskToremove)
        try! context.save()
    }
    
    func retrieve() -> [TaskModel] {
        return try! context.fetch(TasksCoreData.fetchRequest())
    }
    
    func saveAllTasks(tasks: [TaskModel]) {
        try! context.save()
    }
    
    func createTask(name: String, completed: Bool, createdAt: Date) -> TaskModel {
        let newTask = TasksCoreData(context: context)
        newTask.title = name
        newTask.completed = completed
        newTask.createdAt = createdAt
        return newTask
    }
    
    
}
