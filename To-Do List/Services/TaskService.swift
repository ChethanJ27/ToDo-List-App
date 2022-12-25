//
//  TaskService.swift
//  To-Do List
//
//  Created by Chethan J on 19/12/2022.
//

import Foundation

protocol TaskService {
    
    func saveTask(model: TaskModel)
    
    func delete(index: Int,tasks: [TaskModel])
    
    func retrieve()-> [TaskModel]
    
    func saveAllTasks(tasks: [TaskModel])
    
    func createTask(name:String,completed: Bool, createdAt: Date) -> TaskModel 
}

class ServiceManager {
    static let sharedInstance: TaskService = TasksServiceCoreData()
}
