//
//  Task.swift
//  To-Do List
//
//  Created by Chethan J on 11/12/2022.
//

import Foundation

struct TaskModel: Codable {
    
    let title: String
    let createdAt: Date
    let completed: Bool
    
}
