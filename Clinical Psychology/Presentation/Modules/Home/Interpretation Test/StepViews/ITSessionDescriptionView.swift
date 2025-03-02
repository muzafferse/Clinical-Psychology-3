//
//  ITSessionDescriptionView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 12.01.2025.
//

import SwiftUI

struct ITSessionDescriptionView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itStartDescription)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itStartButtonText)
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
    ITSessionDescriptionView(onNext: {})
}
