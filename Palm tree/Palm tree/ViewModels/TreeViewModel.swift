//
//  TreeViewModel.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation
import Combine

@MainActor
class TreeViewModel: ObservableObject {
    
    @Published var items: [TreeItem] = []
    @Published var error: Error?

    var parentName: String?

    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService(),
         items: [TreeItem] = [],
         parentName: String?) {
        
        self.networkService = networkService
        self.parentName = parentName
        if items.isEmpty {
            self.loadTreeDataRequest()
        } else {
            self.items = items
        }
    }
    
    private func loadTreeDataRequest() {
        Task {
            do {
                let request: NetworkRequest = TreeDataRequest()
                let fetchedItems: [TreeItem] = try await networkService.fetch(request: request)
                Task { @MainActor in
                    self.items = fetchedItems
                }
            } catch {
                Task { @MainActor in
                    self.error = error
                }
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}
