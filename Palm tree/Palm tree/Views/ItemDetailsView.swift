//
//  ItemDetailsView.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 17.03.2024.
//

import SwiftUI

struct ItemDetailsView: View {
    
    @StateObject private var viewModel: ItemDetailsViewModel
    
    init(itemId: String) {
        _viewModel = StateObject(wrappedValue: ItemDetailsViewModel(itemId: itemId))
    }
    
    var body: some View {
        List {
            if let itemDetails = viewModel.itemDetails {
                Section(header: Text(Constants.UI.sectionHeaderDetails)) {
                    Text(Constants.UI.idLabel + "\(itemDetails.id)")
                    Text(Constants.UI.createdAtLabel + "\(itemDetails.createdAt)")
                    Text(Constants.UI.createdByLabel + "\(itemDetails.createdBy)")
                    Text(Constants.UI.lastModifiedAtLabel + "\(itemDetails.lastModifiedAt)")
                    Text(Constants.UI.lastModifiedByLabel + "\(itemDetails.lastModifiedBy)")
                    Text(Constants.UI.descriptionLabel + "\(itemDetails.description.isEmpty ? Constants.UI.noName : itemDetails.description)")
                }
            } else if viewModel.isLoading {
                ProgressView(Constants.UI.loading)
            }
        }
        .navigationTitle(Constants.UI.itemDetailsTitle)
        .onAppear {
            viewModel.loadItemDetails()
        }.alert(Constants.UI.error, isPresented: Binding<Bool>(
            get: { self.viewModel.error != nil },
            set: { _ in self.viewModel.error = nil }
        ), presenting: self.viewModel.error) { error in
            Button(Constants.UI.ok) {}
        } message: { error in
            Text(error.localizedDescription)
        }
    }
}
