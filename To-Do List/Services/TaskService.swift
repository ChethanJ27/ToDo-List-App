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
}


class TaskServiceUserDefaults: TaskService {
    
    
    static let sharedInstance = TaskServiceUserDefaults()
    
    var taskModels: [TaskModel] = []
    
    
    func retrieve() -> [TaskModel] {
        guard let encodedData = UserDefaults.standard.array(forKey: "Tasks") as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(TaskModel.self, from: $0) }
    }
    
    func saveTask(model: TaskModel) {
        var tasks = retrieve()
        tasks.append(model)
        let data = tasks.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "Tasks")
    }
    
    func saveAllTasks(tasks: [TaskModel]) {
        let data = tasks.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "Tasks")
    }
    
    func delete(index: Int,tasks:[TaskModel]) {
//        tasks.remove(at: index)
        saveAllTasks(tasks: tasks)
    }
}
