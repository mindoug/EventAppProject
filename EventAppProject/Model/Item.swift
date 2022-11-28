//
//  Item.swift
//  EventAppProject
//
//  Created by Mindy Douglas on 11/20/22.
//

import Foundation

struct Item: Hashable {
    let id = UUID()
    let title: String
    let subtitle : String
    let date: String
    let location: String
    let header: String
    let image: String
    
    init(title: String = "", subtitle: String = "", date: String = "", location: String = "", header: String = "", image: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.location = location
        self.header = header
        self.image = image
    }
}
