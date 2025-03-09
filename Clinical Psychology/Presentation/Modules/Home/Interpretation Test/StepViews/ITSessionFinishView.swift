//
//  ITSessionFinishView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 13.01.2025.
//

import SwiftUI

struct ITSessionFinishView: View {
    let onFinish: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itFinishDescription)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: onFinish,
                   label: {
                Text(AppStrings.itFinishButtonText)
            })
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ITSessionFinishView(onFinish: {})
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
