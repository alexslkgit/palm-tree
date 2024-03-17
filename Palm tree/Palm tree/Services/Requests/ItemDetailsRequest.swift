//
//  ItemDetailsRequest.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

class ItemDetailsRequest: NetworkRequest {
    var url: URL?
    
    init(id: String) {
        let string = Constants.API.itemDetailsPath(id: id)
        self.url = URL(string: string)
    }
}
