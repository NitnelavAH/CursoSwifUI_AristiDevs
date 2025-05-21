//
//  Navigations.swift
//  CursoiOS
//
//  Created by Developer on 20/05/25.
//

import SwiftUI

struct Navigations: View {
    @State private var show = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Abrir Modal"){
                    show.toggle()
                }.padding()
                    .sheet(isPresented: $show) {
                        Modal(texto: "Modal")
                    }
                NavigationLink(destination: SecondView(texto: "Segunda Vista")) {
                    Text("Segunda vista")
                }
            }
            .navigationTitle("Navegación")
            .toolbar {
                HStack {
                    NavigationLink(
                        destination: SecondView(texto: "Segunda Vista")
                    ) {
                        Image(systemName: "plus")
                    }
                    NavigationLink(
                        destination: ThirdView()
                    ) {
                        Image(systemName: "camera")
                    }
                }
            }
        }
    }
}

#Preview {
    Navigations()
}
