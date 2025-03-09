//
//  LaunchView.swift
//  Clinical Psychology 3
//
//  Created by Muzaffer Sevili on 25.01.2025.
//

import SwiftUI

struct LaunchView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Image(splashImage)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.colorBackground
            .ignoresSafeArea()
        )
        .onAppear {
            presentHome()
        }
    }
    
    private func presentHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isPresented = true
        }
    }
    
    private var splashImage: ImageResource {
        #if CLINIC1A
        .splash
#else
        .splash1B
#endif
    }
}

#Preview {
    LaunchView(isPresented: .constant(false))
}
