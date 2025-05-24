//
//  Grids.swift
//  CursoiOS
//
//  Created by Developer on 22/05/25.
//

import SwiftUI

struct Grids: View {
//        let gridItem = [
//            GridItem(.adaptive(minimum: 50)),
//        ]
    
//    let gridItem = [
//            GridItem(.flexible()),
//        ]
    
//    let gridItem = [
//            GridItem(.flexible()),
//            GridItem(.flexible())
//        ]
        
        let gridItem : [GridItem] = Array(
            repeating: .init(
                .flexible(maximum: 80)
            ), count: 3
        )
        
        var body: some View {
            NavigationView{
//                ScrollView(.horizontal)
                ScrollView(){
                    LazyVGrid(columns: gridItem, spacing: 30) {
                        ForEach(lista){ item in
                            Text(item.emoji).font(.system(size: 80))
                        }
                    }
//                    LazyHGrid(rows: gridItem, spacing: 30) {
//                        ForEach(lista){ item in
//                            Text(item.emoji).font(.system(size: 30))
//                        }
//                    }
                }.navigationBarTitle("Grids")
            }
        }
}

#Preview {
    Grids()
}
