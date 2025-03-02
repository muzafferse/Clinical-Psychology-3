//
//  BackButton.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 10.11.2024.
//

import SwiftUI

struct BackButton: ViewModifier {
    let text: String
    let dismissAction: (() -> Void)?
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismissAction?()
                        dismiss()
                    }) {
                        HStack {
                            Image.chevronLeft
                            Text(text)
                        }
                    }
                    .foregroundStyle(.colorWhite)
                }
            }
    }
}
