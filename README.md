# Palm Tree App Documentation

## Overview

The Palm Tree App is a SwiftUI-based iOS application designed to demonstrate a hierarchical data structure and the implementation of navigation, data fetching, error handling, and custom UI components such as a color picker. This documentation covers the main components of the app, including its structure and functionality.

## Installation

To run the Palm Tree App, clone the repository to your local machine, open the project in Xcode, and run it on a simulator or a physical device.
## Components

### Palm_treeApp

The main entry point of the application, responsible for initializing the app's environment objects and setting up the initial view.

- `@StateObject var treeViewModel`: Manages the tree-like data structure.
- `@StateObject private var selectedColorModel`: Stores the currently selected color for UI customization.

### TreeView

A view that displays the hierarchical data structure in a list. It allows navigation through the tree and displays different views based on the type of item (e.g., a branch with children or a leaf).

- `@StateObject var viewModel`: An instance of `TreeViewModel` to manage the data.
- `@EnvironmentObject var selectedColorModel`: Accesses the global selected color.

### TreeViewModel

An observable object acting as the view model for `TreeView`. It handles fetching data, managing the hierarchy, and error reporting.

- `@Published var items`: The current list of items to display.
- `@Published var error`: Stores any errors that occur during data fetching.

### ItemDetailsView

Displays detailed information about a selected item. It showcases how to present detailed data and handle loading states and errors within a SwiftUI view.

- `@StateObject private var viewModel`: The view model for fetching and managing the detailed data of an item.

### ItemDetailsViewModel

The view model for `ItemDetailsView`, handling the fetching of detailed item information and error management.

### CustomColorPicker

A custom SwiftUI view for selecting a color. It demonstrates how to create a reusable UI component and handle user interactions in SwiftUI.

- `@Binding var selectedColor`: A binding to the currently selected color, allowing the picker to update the global state.

## Usage

The app's main flow starts with `Palm_treeApp`, setting up the environment and displaying the `TreeView`. Users can navigate through the hierarchical data structure and select items to view their details. The custom color picker allows users to customize the app's theme color.

## Error Handling

Error handling is implemented using SwiftUI's `.alert` modifier, displaying any errors that occur during data fetching or processing.

## Networking

The app simulates network requests for fetching hierarchical data and item details, showcasing async/await patterns and error handling in Swift.

## Conclusion

The Palm Tree App is a comprehensive example of using SwiftUI for building iOS applications with complex data structures, navigation, async data fetching, and custom UI components. It is designed to be a starting point for understanding how to structure and implement common patterns in SwiftUI apps.
