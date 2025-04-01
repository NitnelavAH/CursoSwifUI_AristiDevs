//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Developer on 31/03/25.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        VStack {
            Image("swift")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Image(systemName: "figure.walk")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
        }
    }
}

#Preview {
    ImageExample()
}
