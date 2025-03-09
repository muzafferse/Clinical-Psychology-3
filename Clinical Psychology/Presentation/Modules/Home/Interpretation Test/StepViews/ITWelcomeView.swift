//
//  ITWelcomeView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 22.09.2024.
//

import SwiftUI

struct ITWelcomeView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itWelcomeMessage)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itWelcomeButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ITWelcomeView(onNext: {})
}
