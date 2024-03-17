//
//  DataParser.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

class DataParser {
    func parse<T: Decodable>(data: Data, type: T.Type) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
