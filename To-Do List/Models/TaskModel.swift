//
//  Task.swift
//  To-Do List
//
//  Created by Chethan J on 11/12/2022.
//

import Foundation


protocol TaskModel {

    var title: String { get }
    var createdAt: Date { get }
    var completed: Bool { get }

}

struct TaskModelUD: TaskModel,Codable {

    let title: String
    let createdAt: Date
    let completed: Bool

}
