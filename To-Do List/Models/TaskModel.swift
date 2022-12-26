//
//  Task.swift
//  To-Do List
//
//  Created by Chethan J on 11/12/2022.
//

import Foundation


protocol TaskModel {

    var title: String? { get set }
    var createdAt: Date? { get }
    var completed: Bool { get set }

}

struct TaskModelUD: TaskModel,Codable {

    var title: String?
    var createdAt: Date?
    var completed: Bool

}
