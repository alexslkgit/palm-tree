//
//  Palm_treeApp.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 13.03.2024.
//

import SwiftUI

@main
struct Palm_treeApp: App {
    
    @StateObject var viewModel = TreeViewModel(parentName: Constants.UI.rootDirectory)
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TreeView(viewModel: viewModel)
            }
        }
    }
}
