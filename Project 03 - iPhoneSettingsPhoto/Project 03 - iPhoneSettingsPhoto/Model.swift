//
//  Model.swift
//  Project 03 - iPhoneSettingsPhoto
//
//  Created by meister on 2021/05/06.
//

import Foundation

enum CellType: String {
    case disclosure
    case `switch`
    case sheet
    case checkmark
}

struct Item {
    var title: String
    var type: CellType
    var imageName: String?
    var on: Bool
    
    init(title: String, type: CellType, on: Bool = false, imageName: String? = nil) {
        self.title = title
        self.type = type
        self.on = on
        self.imageName = imageName
    }
}

struct Section {
    var items: [Item]
    var header: String?
    var footer: String?
    
    init(items: [Item], header: String? = nil, footer: String? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
    
    static func data() -> [Section] {
        return [
            Section(items: [Item(title: "Siri & Search", type: .disclosure, imageName: "magnifyingglass")], header: "ALLOW PHOTOS TO ACCESS"),
            Section(items: [Item(title: "Hidden Album", type: .switch, on: true )], footer: "When enabled, the Hidden album will appear in the Albums tab, under Utilities."),
            Section(items: [Item(title: "Auto-Play Videos", type: .switch, on: true), Item(title: "Summarize Photos", type: .switch, on: true)], header: "PHOTOS TAB", footer: "The Photos tab shows every photo in your library in all views. You can choose compact, summarized views for Collections and Years."),
            Section(items: [Item(title: "Reset Suggested Memories", type: .sheet), Item(title: "Show Holiday Eveents", type: .switch, on: true)], header: "MEMORIES", footer: "You can choose to see holiday events for your home country."),
            Section(items: [Item(title: "Automatic", type: .checkmark, on: true), Item(title: "Keep Originals", type: .checkmark, on: false)], header: "TRANSFER TO MAC OR PC", footer: "Automatically transfer photos and videos in a compatible format, or always transfer the original file without checking for compatibility.")
        ]
    }
}
