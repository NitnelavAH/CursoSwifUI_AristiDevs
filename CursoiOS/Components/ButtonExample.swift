//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Developer on 31/03/25.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Submint"){
            print("Submit")
        }
        
        Button(action: {
            print("Submit 2")
        }, label: {
            Text("Submit")
                .frame(width: 130)
                .padding()
                .foregroundStyle(.yellow)
                .background(.black)
                .bold()
                .font(.title)
                .cornerRadius(10)
        })
        Button(action: {
            print("Submit image")
        }, label: {
            Image("swift")
                .resizable()
                .frame(width: 100)
                .scaledToFit()
        })
    }
}

#Preview {
    ButtonExample()
}
