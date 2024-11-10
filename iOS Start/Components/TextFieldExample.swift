//
//  TextFieldExample.swift
//  iOS Start
//
//  Created by Jaime Serrano on 9/11/24.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            TextField("Escribe Tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email, {oldValue, newValue in print("El anitguo valor era \(oldValue) y el nuevo es \(newValue)")})
        }
        SecureField("Escribe tu contraseña", text: $password)
            .keyboardType(.default)
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal, 32)
            .onChange(of: password, {oldValue, newValue in print("El anitguo valor era \(oldValue) y el nuevo es \(newValue)")})
    }
}

#Preview {
    TextFieldExample()
}
