//
//  MenuView.swift
//  CursoiOS
//
//  Created by Developer on 01/04/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack {
        
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                        .padding()
                }
                
                Text("APP 2")
                Text("APP 3")
            }
        }
    }
}

#Preview {
    MenuView()
}
