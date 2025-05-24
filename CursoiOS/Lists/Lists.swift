//
//  ListAndGrids.swift
//  CursoiOS
//
//  Created by Developer on 22/05/25.
//

import SwiftUI

struct Lists: View {
    var body: some View {
        NavigationView {
            List(lista) { item in
                NavigationLink(
                    destination: VistaDetalle(items: item)
                ) {
                    HStack {
                        MyEmoji(emoji: item)
                        Text(item.nombre)
                    }
                }
            }.navigationTitle("Lista")
        }
    }
}

struct MyEmoji: View {
    let emoji : Modelo
    var body: some View{
        ZStack{
            Text(emoji.emoji)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(
                    Circle().stroke(Color.purple, lineWidth: 3)
                )
        }
    }
}

struct VistaDetalle: View {
    
    let items : Modelo
    
    var body: some View{
        VStack(alignment: .leading, spacing: 3, content: {
            HStack{
                MyEmoji(emoji: items)
                Text(items.nombre).font(.largeTitle)
                Spacer()
            }
            Text(items.descripcion).padding(.top)
            Spacer()
        })
        .padding(.all)
        .navigationBarTitle("Emojis")
    }
}

#Preview {
    Lists()
}
