//
//  CustomTextField.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var inputText: String
    var isSecureField: Bool?
    
    var body: some View {
        if isSecureField == true {
            SecureField(placeholder, text: $inputText)
                .modifier(CustomTextFieldModifier())
        } else {
            TextField(placeholder, text: $inputText)
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
    CustomTextField(placeholder: "Email", inputText: .constant(""))
}
