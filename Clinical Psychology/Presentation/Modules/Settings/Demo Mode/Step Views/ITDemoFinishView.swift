//
//  ITTrainingFinishView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 12.01.2025.
//

import SwiftUI

struct ITDemoFinishView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itDemoModeFinishDescription)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itDemoModeFinishButtonText)
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
    ITDemoFinishView(onNext: {})
}
