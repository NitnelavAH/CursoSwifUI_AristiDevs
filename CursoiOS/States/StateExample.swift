//
//  State.swift
//  CursoiOS
//
//  Created by Developer on 23/05/25.
//

import SwiftUI

struct StateExample: View {
    
    @State private var show = true
    @State private var numero = 0
    @State private var x = ""
    var y = 0
    
    func suma() -> Int {
        x = "Cambiando Valor" // variable viene de fuera de la func usa el State
        var y = 2 //se crea dentro de la funcion no usa State
        y = 4
        return y
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(x).font(.title2).opacity(0.7)
            HStack {
                TextField("Comentario...", text: $x)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(16)
                HStack {
                    
                    Button(action: {
                        show.toggle()
                        if show {
                            numero -= 1
                        } else {
                            numero += 1
                        }
                    }) {
                        if show {
                            Image(systemName: "heart").foregroundColor(.red).font(.largeTitle)
                        } else {
                            Image(systemName: "heart.fill").foregroundColor(.red).font(.largeTitle)
                        }
                        
                        Text(String(numero)).bold().foregroundColor(.black)
                    }
                }
            }
            vista2(x: $x)
            vista3(x: $x)
            
        }.padding(.horizontal, 32)

    }
}

struct vista2: View {
    @Binding var x: String
    var body: some View {
        Text(x).opacity(0.2).padding(.bottom, 8)
    }
}

struct vista3: View {
    @Binding var x: String
    var body: some View {
        Button(action: {
            x = ""
        }) {
            Image(
                systemName: "trash"
            ).foregroundColor(.red)
        }
    }
}

#Preview {
    StateExample()
}
