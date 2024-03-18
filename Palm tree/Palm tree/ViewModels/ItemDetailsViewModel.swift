//
//  ItemDetailsViewModel.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import Combine

@MainActor
class ItemDetailsViewModel: ObservableObject {
    
    @Published var itemDetails: ItemDetails?
    @Published var error: Error?
    @Published var isLoading = false
    
    let itemId: String
    private let networkService = NetworkService()
    
    init(itemId: String) {
        self.itemId = itemId
    }
    
    func loadItemDetails() {
        isLoading = true
        Task {
            do {
                let details: ItemDetails = try await networkService.fetch(request: ItemDetailsRequest(id: itemId))
                Task { @MainActor in
                    self.itemDetails = details
                    self.isLoading = false
                }
            } catch {
                Task { @MainActor in 
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
}
