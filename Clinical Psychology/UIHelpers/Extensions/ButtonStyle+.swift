//
//  ButtonStyle+.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

/** It provides to reach custom button easily
 i.e .buttonStyle(.customButton($simpleButton))
 */
extension ButtonStyle where Self == CustomButtonView {
    static func customButton(_ buttonType: Binding<CustomButtonStyle>) -> Self {
        return CustomButtonView(buttonType: buttonType)
    }
}
