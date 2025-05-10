//
//  SuperHeroSearcher.swift
//  CursoiOS
//
//  Created by Developer on 09/04/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {

    @StateObject private var viewModel = HeroSearchViewModel()
    
    var body: some View {
        VStack {
           
            
            TextField(
                "Búscar",
                text: $viewModel.search,
                prompt: Text("Spiderman...")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding()
            .border(.purple, width: 1.5)
            .padding()
            .autocorrectionDisabled()

            if(viewModel.loading) {
                ProgressView().tint(.white)
            }
            
            NavigationStack {
                List(viewModel.wrapper?.results ?? []) { superhero in
                    ZStack {
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(destination: SuperHeroDetail(id: superhero.id)) {
                            EmptyView().opacity(0)
                        }
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundApp)
    }
}

struct SuperHeroItem: View {
    let superhero: ApiNetwork.SuperHero
    
    var body: some View {
            ZStack{
                WebImage(url: URL(string: superhero.image.url))
                               .resizable()
                               .indicator(.activity)
                               .scaledToFill()
                               .frame(height: 200)
                VStack{
                    Spacer()
                    Text(superhero.name).foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(.white.opacity(0.5))
                }
            }.frame(height: 200).cornerRadius(32)
            
        }
}

#Preview {
    SuperHeroSearcher()
}
