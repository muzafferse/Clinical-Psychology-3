//
//  FinishView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct FinishView: View {
    let viewModel: CautionTestViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.ctFinishDescription)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: {
                #if CLINIC1A
                self.appState.homeNavigation.append(HomeNavDestination.interpretationTest)
                #elseif CLINIC1B
                SessionManager.shared.saveSessionData()
                appState.homeNavigation = .init()
                #endif
            }, label: {
                Text(AppStrings.ctFinishButtonText)
            })
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
    FinishView(viewModel: CautionTestViewModel())
}
