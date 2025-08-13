//
//  IpadTest.swift
//  CursoiOS
//
//  Created by Developer on 12/08/25.
//

import SwiftUI

struct IpadTest: View {
    var device = UIDevice.current.userInterfaceIdiom
    var iPadSimulator = UIDevice.current.model.hasPrefix("iPad")
    
    var body: some View {
        VStack{
            if device == .phone  && iPadSimulator {
                Text("Estamos en un Ipad en modo de simulacion")
            }else{
                Text("Estamos en el iPhone")
            }
        }.onAppear(){
            print(UIDevice.current.model)
        }
    };
}

#Preview {
    IpadTest()
}
