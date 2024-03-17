//
//  NetworkService.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Combine
import Foundation

class NetworkService {
    
    private let session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    
    func fetch<T: Decodable>(request: NetworkRequest, decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        guard let url = request.url else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        return try decoder.decode(T.self, from: data)
    }
}
