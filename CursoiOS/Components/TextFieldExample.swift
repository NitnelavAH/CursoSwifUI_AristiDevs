//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by Developer on 01/04/25.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            //TextField("Escribe tu email", text: $email)
              //  .keyboardType(.emailAddress)
                //.padding()
               // .background(.gray.opacity(0.4))
               // .foregroundColor(.blue)
               // .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email, { oldVlue, newValue in
                    print("Antiguo \(oldVlue), Nuevo \(newValue)")
                })
            SecureField("Escribe tu contraseña", text: $password)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password, { oldVlue, newValue in
                    print("Antiguo \(oldVlue), Nuevo \(newValue)")
                })
        }.padding()
    }
}

#Preview {
    TextFieldExample()
}
