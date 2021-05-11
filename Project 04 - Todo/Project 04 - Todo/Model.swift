//
//  Model.swift
//  Project 04 - Todo
//
//  Created by meister on 2021/05/11.
//

import Foundation

class Model {
    var date: Date
    var task: String
    
    init(task: String) {
        self.task = task
        self.date = Date()
    }
    
    static var dummy = [
        Model(task: "Work out"),
        Model(task: "I have to learn CS")
    ]
}
