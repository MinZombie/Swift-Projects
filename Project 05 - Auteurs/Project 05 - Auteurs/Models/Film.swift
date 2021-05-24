//
//  Film.swift
//  Project 05 - Auteurs
//
//  Created by meister on 2021/05/24.
//

import Foundation

struct Films: Codable {
    var films: [Film]
}

struct Film: Codable {
    var title: String
    var year: String
    var poster: String
    var plot: String
}
