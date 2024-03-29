//
//  TreeView.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 13.03.2024.
//

import SwiftUI

struct TreeView: View {
    
    @StateObject var viewModel: TreeViewModel
    @EnvironmentObject var selectedColorModel: SelectedColorModel

    var body: some View {
        List {
            ForEach(viewModel.items, id: \.id) { item in
                if let children = item.children, !children.isEmpty {
                    let childViewModel = TreeViewModel(networkService: viewModel.networkService, 
                                                       items: children, parentName: item.label)
                    NavigationLink(destination: TreeView(viewModel: childViewModel)
                        .environmentObject(selectedColorModel)) {
                        Text(item.label ?? Constants.UI.noName)
                    }
                } else {
                    NavigationLink(destination: ItemDetailsView(itemId: item.id).environmentObject(selectedColorModel)) {
                        Text(item.label ?? Constants.UI.noName)
                    }
                }
            }
            .onMove(perform: move)
        }
        .scrollContentBackground(.hidden)
        .background(selectedColorModel.color.opacity(0.2))
        .navigationTitle(viewModel.parentName ?? Constants.UI.rootDirectory)
        .toolbar { EditButton() }
        .alert(Constants.UI.error, isPresented: Binding<Bool>(
            get: { self.viewModel.error != nil },
            set: { _ in self.viewModel.error = nil }
        ), presenting: self.viewModel.error) { error in
            Button(Constants.UI.ok) {}
        } message: { error in
            Text(error.localizedDescription)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        viewModel.move(from: source, to: destination)
    }
}

#Preview {
    TreeView(viewModel: TreeViewModel(networkService: NetworkService(),
                                      parentName: Constants.UI.rootDirectory))
}
