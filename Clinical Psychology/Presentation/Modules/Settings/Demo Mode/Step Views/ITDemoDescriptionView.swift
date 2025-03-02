//
//  ITTrainingDescriptionView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 22.09.2024.
//

import SwiftUI

struct ITDemoDescriptionView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itDemoModeDescription)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itDemoModeButtonText)
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
    ITDemoDescriptionView(onNext: {})
}
