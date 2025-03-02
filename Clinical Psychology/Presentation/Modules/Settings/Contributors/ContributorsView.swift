//
//  ContributorsView.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

//TODO: Future Work - Contributors
/*
struct ContributorsView: View {
    @ObservedObject var viewModel = ContributorsViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List(viewModel.contributorsData) { contributor in
            HStack {
                personInfoView(person: contributor)
                Spacer()
                emailView(person: contributor)
            }
            .listRowBackground(Color.colorBackground)
            .listRowSeparatorTint(.colorInactive)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden()
        .navigationTitle(AppStrings.contributorsTitle)
        .navigationBarTitleTextColor(.colorWhite)
        .backButton(text: AppStrings.contributorsBackButtonText)
    }
}

extension ContributorsView {
    private func personInfoView(person: Contributor) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(person.name)
                .mediumTextStyle(size: 16)
            
            Text(person.title)
                .regularTextStyle(size: 14)
            
            Text(person.company)
                .regularTextStyle(size: 14)
        }
        .padding(.vertical, 10)
    }
    
    private func emailView(person: Contributor) -> some View {
        VStack {
            if let encodedEmail = person.email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let mailURL = URL(string: "mailto:\(encodedEmail)") {
                Link(destination: mailURL) {
                    VStack(alignment: .center, spacing: 5) {
                        Image.mailIcon
                            .regularTextStyle(size: 32)
                        
                        Text(AppStrings.contactButtonText)
                            .regularTextStyle(size: 14)
                    }
                }
            }
        }
    }
}

#Preview {
    ContributorsView()
}
*/
