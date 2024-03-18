//
//  Constants.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

struct Constants {
    
    struct API {
        static let treeDataPath = "https://ubique.img.ly/frontend-tha/data.json"
        
        static func itemDetailsPath(id: String) -> String {
            "https://ubique.img.ly/frontend-tha/entries/\(id).json"
        }
    }
    
    struct UI {
        static let noName = "Item with no name"
        static let rootDirectory = "Root directory"
        static let itemDetailsTitle = "Item Details"
        static let loading = "Loading..."
        static let sectionHeaderDetails = "Details"
        static let idLabel = "ID: "
        static let createdAtLabel = "Created At: "
        static let createdByLabel = "Created By: "
        static let lastModifiedAtLabel = "Last Modified At: "
        static let lastModifiedByLabel = "Last Modified By: "
        static let descriptionLabel = "Description: "
        static let error = "Error: "
        static let ok = "OK"
    }
    
}
