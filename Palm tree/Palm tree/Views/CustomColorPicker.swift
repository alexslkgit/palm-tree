//
//  CustomColorPicker.swift
//  Palm tree
//
//  Created by Slobodianiuk Oleksandr on 18.03.2024.
//

import SwiftUI

struct CustomColorPicker: View {
    
    @Binding var selectedColor: Color
    
    private let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .brown, .black]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 50, height: 50)
                        .opacity(color == selectedColor ? 0.5 : 1.0)
                        .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                        .onTapGesture {
                            selectedColor = color
                        }
                }
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
}
