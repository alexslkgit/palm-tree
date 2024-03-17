//
//  ItemDetails.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

struct ItemDetails: Decodable {
    let id: String
    let createdAt: String
    let createdBy: String
    let lastModifiedAt: String
    let lastModifiedBy: String
    let description: String
}
