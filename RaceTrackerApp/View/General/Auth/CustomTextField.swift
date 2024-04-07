//
//  CustomTextField.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

enum PlaceholderTypes: String {
    case email = "Email"
    case password = "Password"
    case fullname = "Fullname"
    case username = "Username"
}

struct CustomTextField: View {
    let placeholder: PlaceholderTypes
    @Binding var inputText: String
    var isSecureField: Bool?
    
    var body: some View {
        if isSecureField == true {
            SecureField(placeholder.rawValue, text: $inputText)
                .modifier(CustomTextFieldModifier())
        } else {
            TextField(placeholder.rawValue, text: $inputText)
                .modifier(CustomTextFieldModifier())
        }
    }
}

struct CustomTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color(.systemGray6))
            )
    }
}

#Preview {
    CustomTextField(placeholder: PlaceholderTypes.email, inputText: .constant(""))
}
