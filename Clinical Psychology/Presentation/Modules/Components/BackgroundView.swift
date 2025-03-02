//
//  BackgroundView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    var content: Content
    var height: CGFloat
    var color: Color
    
    init(@ViewBuilder content: @escaping () -> Content,
         height: CGFloat,
         color: Color = .white) {
        self.content = content()
        self.height = height
        self.color = color
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(height: height)
            .foregroundStyle(color)
            .overlay(
                HStack {
                    content
                }
                    .padding(.horizontal, 8))
    }
}

#Preview {
    BackgroundView(content:  {
        EmptyView()
    }, height: 42)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
        Color(.colorBackground)
            .ignoresSafeArea()
    )
}
