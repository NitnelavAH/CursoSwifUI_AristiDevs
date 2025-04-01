//
//  TextExample.swift
//  CursoiOS
//
//  Created by Developer on 31/03/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text("Hello, World!").font(.headline)
            Text("Custom").font(
                .system(
                    size: 32,
                    weight: .bold,
                    design: .monospaced
                )
            )
            .italic()
            .underline()
            .foregroundColor(.yellow)
            .background(.black)
            .padding()
            
            Text("Hola Mundo Hola Mundo Hola Mundo Hola Mundo")
                .frame(width: 150)
                .lineLimit(2)
                .lineSpacing(15)
        }
    }
}

#Preview {
    TextExample()
}
