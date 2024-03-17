//
//  TreeView.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 13.03.2024.
//

import SwiftUI

struct TreeView: View {
    
    @StateObject var viewModel: TreeViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.items, id: \.uniqueID) { item in
                
                if let children = item.children, !children.isEmpty {
                    let childViewModel = TreeViewModel(items: children, parentName: item.label)
                    NavigationLink(destination: TreeView(viewModel: childViewModel)) {
                        Text(item.label ?? Constants.UI.noName)
                    }
                } else if let id = item.id {
                    NavigationLink(destination: ItemDetailsView(itemId: id)) {
                        Text(item.label ?? Constants.UI.noName)
                    }
                } else {
                    Text(item.label ?? Constants.UI.noName)
                }
            }.onMove(perform: move)
        }
        .navigationTitle(viewModel.parentName ?? Constants.UI.rootDirectory)
        .toolbar {
            EditButton()
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        viewModel.move(from: source, to: destination)
    }
}

#Preview {
    TreeView(viewModel: TreeViewModel(parentName: Constants.UI.rootDirectory))
}