//
//  Protocolls+Extensions.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

protocol NetworkSession {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {}


