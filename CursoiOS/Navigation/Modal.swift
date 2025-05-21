//
//  Modal.swift
//  CursoiOS
//
//  Created by Developer on 20/05/25.
//

import SwiftUI

struct Modal: View {
    @Environment(\.presentationMode) var back
    var texto : String
    
    var body: some View {
        ZStack{
            Color.orange.edgesIgnoringSafeArea(.all)
            VStack {
                Text(texto)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Button("Cerrar"){
                    back.wrappedValue.dismiss()
                }
            }
        }
    }
}
