//
//  Film.swift
//  Project 05 - Auteurs
//
//  Created by meister on 2021/05/24.
//

import Foundation

struct Film: Codable {
    var title: String
    var year: String
    var poster: String
    var plot: String
    var isExpanded: Bool
    
    // isExpanded 프로퍼티에 값을 주기 위한 커스텀 디코딩
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      title = try container.decode(String.self, forKey: .title)
      year = try container.decode(String.self, forKey: .year)
      poster = try container.decode(String.self, forKey: .poster)
      plot = try container.decode(String.self, forKey: .plot)
      isExpanded = false
    }
}
