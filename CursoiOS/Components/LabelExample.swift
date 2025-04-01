//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Developer on 31/03/25.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("SWIFT", image: "swift")
        Label("SWIFT", systemImage: "figure.badminton")
        Label(title: {
            Text("Swift")
        }, icon: {
            Image("swift")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
            }
        )
        
        
    }
}

#Preview {
    LabelExample()
}
