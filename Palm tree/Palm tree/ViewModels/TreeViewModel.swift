//
//  TreeViewModel.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Foundation

@MainActor
class TreeViewModel: ObservableObject {
    
    @Published var items: [TreeItem] = []
    @Published var error: Error?

    var parentName: String?

    let networkService: NetworkService
    
    init(networkService: NetworkService,
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
                let fetchedItems: [TreeItem] = try await networkService.fetch(request: TreeDataRequest())
                self.items = fetchedItems
            } catch {
                self.error = error
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}
