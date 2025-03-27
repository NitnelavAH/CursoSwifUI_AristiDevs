//
//  ContentView.swift
//  CursoiOS
//
//  Created by Developer on 26/03/25.
//

import SwiftUI

struct Exersice1: View {
    var body: some View {
        
        VStack {
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
            Rectangle().frame(height: 100).foregroundColor(.orange)
            HStack {
                Circle().foregroundColor(.green)
                Rectangle().frame(height: 200)
                Circle().foregroundColor(.indigo)
            }
            Rectangle().frame(height: 100).foregroundColor(.orange)
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
        }.background(.red)
        
    }
}

#Preview {
    Exersice1()
}
