//
//  Section.swift
//  EventAppProject
//
//  Created by Mindy Douglas on 11/20/22.
//

import Foundation

struct Section: Hashable {
    let id = UUID()
    
    let type: SectionType
    let title: String
    let items: [Item]
    
    init(type: SectionType, title: String = "", subtitle: String = "", items: [Item] = []) {
        self.type = type
        self.title = title
        self.items = items
    }
    
    enum ItemSectionType: String {
        case featured
        case recommended
        case latest
        case categories
        case header
    }
    
    struct SectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        static let featured = SectionType(rawValue: Section.ItemSectionType.featured.rawValue)
        static let recommended = SectionType(rawValue: Section.ItemSectionType.recommended.rawValue)
        static let latest = SectionType(rawValue: Section.ItemSectionType.latest.rawValue)
        static let categories = SectionType(rawValue: Section.ItemSectionType.categories.rawValue)
        static let header = SectionType(rawValue: Section.ItemSectionType.header.rawValue)

    }
}
