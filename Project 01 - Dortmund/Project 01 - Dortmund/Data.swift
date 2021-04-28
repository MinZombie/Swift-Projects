//
//  DataSource.swift
//  Project 01 - Dortmund
//
//  Created by meister on 2021/04/23.
//

import Foundation

class Data {
    var name: String
    var imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    static let list = [
        Data(name: "Dortmund U-Tower", imageName: "tower"),
        Data(name: "Phoenix-See", imageName: "see"),
        Data(name: "Westfalenpark", imageName: "westfalenpark"),
        Data(name: "Signal Iduna Park", imageName: "stadion")
    ]
}

