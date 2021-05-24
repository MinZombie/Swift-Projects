//
//  Auteurs.swift
//  Project 05 - Auteurs
//
//  Created by meister on 2021/05/24.
//

import Foundation

struct Auteurs: Codable {
    var auteurs: [Auteur]
}

struct Auteur: Codable {
    var name: String
    var bio: String
    var image: String
    var source: String
    var films: [Film]
}
