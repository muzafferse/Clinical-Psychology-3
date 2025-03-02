//
//  AnswerTextFieldView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 11.11.2024.
//

import SwiftUI

struct AnswerTextFieldView: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    var expectedCharacter: String
    var onCorrectInput: () -> Void
    
    var body: some View {
        BackgroundView(content: {
            TextField("", text: $text)
                .robotoMediumFont(size: 13)
                .foregroundStyle(.colorPrimary)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .focused($isFocused)
                .keyboardType(.alphabet)
                .onAppear {
                    isFocused = true
                }
                .onChange(of: text) { newValue in
                    if newValue.count > 1 {
                        text = String(newValue.prefix(1))
                    }
                    
                    if newValue == expectedCharacter {
                        onCorrectInput()
                        text = ""
                    } else if !newValue.isEmpty {
                        text = ""
                    }
                }
                .onChange(of: isFocused) { newValue in
                    if !newValue {
                        isFocused = true
                    }
                }
        }, height: 48)
    }
}

#Preview {
    AnswerTextFieldView(text: .constant(""),
                        expectedCharacter: "e",
                        onCorrectInput: {})
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
        Color(.colorBackground)
            .ignoresSafeArea()
    )
}
