//
//  TreeDataRequest.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

class TreeDataRequest: NetworkRequest {
    var url: URL? = URL(string: Constants.API.treeDataPath)
}
