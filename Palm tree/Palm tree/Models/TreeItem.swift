//
//  TreeItem.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

struct TreeItem: Decodable, Hashable {
    
    let id: String?
    let label: String?
    let children: [TreeItem]?
    
    var isLeaf: Bool {
        return children == nil
    }
    
    var uniqueID: String {
        id ?? UUID().uuidString
    }
}
