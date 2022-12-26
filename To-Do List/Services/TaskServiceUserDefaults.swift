//
//  TaskServiceUserDefaults.swift
//  To-Do List
//
//  Created by Chethan J on 25/12/2022.
//

import Foundation

class TaskServiceUserDefaults: TaskService {
    
    func createTask(name:String,completed: Bool, createdAt: Date) -> TaskModel {
        return TaskModelUD(title: name, createdAt: createdAt, completed: completed)
    }
    

    static let sharedInstance = TaskServiceUserDefaults()

    var taskModels: [TaskModel] = []


    func retrieve() -> [TaskModel] {
        guard let encodedData = UserDefaults.standard.array(forKey: "Tasks") as? [Data] else {
            return []
        }

        return encodedData.map { try! JSONDecoder().decode(TaskModelUD.self, from: $0) }
    }

    func saveTask(model: TaskModel) {
        var tasks = retrieve()
        tasks.append(model)
        let t = tasks as! [TaskModelUD]
        let data = t.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "Tasks")
    }

    func saveAllTasks(tasks: [TaskModel]) {
        let t = tasks as? [TaskModelUD]
        let data = t.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data!, forKey: "Tasks")
    }

    func delete(index: Int,tasks:[TaskModel]) {
        var t = tasks
        t.remove(at: index)
        saveAllTasks(tasks: t)
    }
}
