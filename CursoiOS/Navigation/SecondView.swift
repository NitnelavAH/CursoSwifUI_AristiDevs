//
//  SecondView.swift
//  CursoiOS
//
//  Created by Developer on 20/05/25.
//

import SwiftUI

struct SecondView: View {
    var texto : String
    var body: some View {
        Text("Mi Segunda vista")
            .padding()
            .navigationTitle(texto)
        NavigationLink(destination: ThirdView()){
            Text("Ir a tercer vista")
        }
    }
}

