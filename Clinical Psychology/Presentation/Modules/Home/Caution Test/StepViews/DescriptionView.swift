//
//  DescriptionView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct DescriptionView: View {
    let viewModel: CautionTestViewModel
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.ctStartDescription)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.ctStartButtonText)
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
    DescriptionView(viewModel: CautionTestViewModel(),
                    onNext: {})
}
