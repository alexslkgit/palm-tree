//
//  Palm_treeApp.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 13.03.2024.
//

import SwiftUI

@main
struct Palm_treeApp: App {
    
    @StateObject var treeViewModel = TreeViewModel(parentName: Constants.UI.rootDirectory)
    @StateObject private var selectedColorModel = SelectedColorModel()

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack {
                    TreeView(viewModel: treeViewModel)
                        .environmentObject(selectedColorModel)
                }
                .navigationViewStyle(.stack)
                .background(selectedColorModel.color.opacity(0.2))
                VStack {
                    Spacer()
                    CustomColorPicker(selectedColor: $selectedColorModel.color)
                }
            }
        }
    }
}
