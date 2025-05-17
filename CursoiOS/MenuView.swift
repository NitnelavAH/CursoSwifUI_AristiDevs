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
            List {
        
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                        .padding()
                }
                NavigationLink(destination: SuperHeroSearcher()) {
                    Text("SuperHero Finder")
                        .padding()
                }
                NavigationLink(destination: FavPlaces()) {
                    Text("Fav Places")
                        .padding()
                }
                
                
            }
        }
    }
}

#Preview {
    MenuView()
}
