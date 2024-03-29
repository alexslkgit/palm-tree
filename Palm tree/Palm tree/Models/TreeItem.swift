//
//  TreeItem.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

struct TreeItem: Decodable, Hashable {
    
    let id: String
    let label: String?
    let children: [TreeItem]?
    
    var isLeaf: Bool {
        return children == nil
    }

    init(id: String? = nil, label: String? = nil, children: [TreeItem]? = nil) {
        self.id = id ?? UUID().uuidString
        self.label = label
        self.children = children
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id: String? = try container.decodeIfPresent(String.self, forKey: .id)
        let label: String? = try container.decodeIfPresent(String.self, forKey: .label)
        let children: [TreeItem]? = try container.decodeIfPresent([TreeItem].self, forKey: .children)
        
        self.init(id: id, label: label, children: children)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, label, children
    }
}
