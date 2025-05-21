//
//  Stacks.swift
//  CursoiOS
//
//  Created by Developer on 19/05/25.
//

import SwiftUI

struct Stacks: View {
    // valores de entorno o environmentValues
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        if sizeClass == .compact {
            compactDesign(dark: colorScheme == .dark, numero: "527221454545")
        }else{
            regularDesign()
        }
    }
}

struct compactDesign: View {
    
    let dark: Bool
    let numero: String
    let mensaje = "Hola como estas?"
    
    func sendMessage(){
        let sms = "sms:\(numero)&body=\(mensaje)"
        guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return  }
        UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
    }
    
    func sendCall(){
        guard let number = URL(string: "tel://\(numero)") else { return  }
        UIApplication.shared.open(number)
    }
    
    var body: some View{
        ZStack{
            dark ? Color.gray.opacity(0.8).edgesIgnoringSafeArea(.all) : Color.green.edgesIgnoringSafeArea(.all)
            VStack(){
                Image(systemName: "person.crop.circle").font(.system(size: 100, weight: .bold))
                Text("Maria Ramirez")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text("Calle #123")
                    .foregroundColor(.white)
                    .font(.title).italic()
                HStack{
                    Button(action:{
                        sendCall()
                    }){
                        Image(systemName: "phone.fill")
                            .modifier(boton(color: .blue))
                    }
                    Button(action:{
                        sendMessage()
                    }){
                        Image(systemName: "message.fill")
                            .modifier(boton(color: .red))
                    }
                }
            }
        }
    }
}

struct boton : ViewModifier {
    var color : Color
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
}

struct regularDesign: View {
    var body: some View{
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            HStack(){
                Image("swift")
                    .resizable()
                    .frame(width: 130, height: 100, alignment: .center)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10){
                    Text("Maria Ramirez")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("Calle #123")
                        .foregroundColor(.white)
                        .font(.title).italic()
                }
                
            }
        }
    }
}


#Preview("Compact Layout") {
    Stacks()
        .environment(\.horizontalSizeClass, .compact)
}

#Preview("Regular Layout") {
    Stacks()
        .environment(\.horizontalSizeClass, .regular)
}
