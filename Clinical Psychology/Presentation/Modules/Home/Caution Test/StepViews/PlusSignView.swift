//
//  PlusSignView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct PlusSignView: View {
    let viewModel: CautionTestViewModel
    
    var body: some View {
        Image.plusIcon
            .regularTextStyle(size: 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(.colorBackground)
                    .ignoresSafeArea()
            )
    }
}

#Preview {
    PlusSignView(viewModel: CautionTestViewModel())
}
