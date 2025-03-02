//
//  PhotosView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct PhotosView: View {
    let viewModel: CautionTestViewModel
    
    var body: some View {
        let trial = viewModel.currentTrial
        VStack(spacing: 32) {
            if trial.position == .topNeutral {
                trial.neutralImage.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
                
                trial.ocdImage.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
                
            } else {
                trial.ocdImage.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
                
                trial.neutralImage.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    PhotosView(viewModel: CautionTestViewModel())
}
