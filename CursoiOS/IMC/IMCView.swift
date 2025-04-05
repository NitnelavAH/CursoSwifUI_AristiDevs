//
//  IMCView.swift
//  CursoiOS
//
//  Created by Developer on 01/04/25.
//

import SwiftUI

struct IMCView: View {
    
//    init() {
//        UINavigationBar.appearance()
//            .titleTextAttributes =
//        [.foregroundColor: UIColor.white]
//    }
    
    @State var gender: Int = 0
    @State var age: Int = 18
    @State var weight: Int = 50
    @State var height: Double = 150
    
    var body: some View {
        VStack{
            HStack {
                ToggleButton(text: "Mujer", imageName: "female", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Hombre", imageName: "male", gender: 1, selectedGender: $gender)
            }
            
            HeightCalculator(selectedHeight: $height)
            
            HStack {
                CounterComponent(count: $age, title: "Edad")
                CounterComponent(count: $weight, title: "Peso")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar {
            ToolbarItem(placement: .principal, content: {
                Text("IMC Calculator").foregroundColor(.white)
            })
        }
//        .navigationBarBackButtonHidden()
//        .navigationTitle("IMC Calculator")
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    
    var body: some View {
        let color = if(gender == selectedGender) {
            Color.backgroundComponentSelected
        } else {
            Color.backgroundComponent
        }
        
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                InformationText(text: text)
                    
            }.frame(
                maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
        }
    }
}

struct InformationText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
    
}

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(.gray)
    }
    
}

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in:50...250, step: 1)
                .accentColor(.blue)
                .padding(.horizontal, 16)
        }.frame(
            maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}

struct CounterComponent: View {
    @Binding var count: Int
    let title: String

    
    var body: some View {
        VStack {
            TitleText(text: title)
            InformationText(text: "\(count)")
            
            HStack(spacing: 24) {
                ButtonCounter(count: $count, add: false)
                
                ButtonCounter(count: $count, add: true)
            }
        }.frame(
            maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}

struct ButtonCounter: View {
    @Binding var count: Int
    let add: Bool
   var body: some View {
       Button(action: {
           if(!add && count == 1) {return}
                
           if(add) {
               count += 1
           } else {
               count -= 1
           }
       }) {
           Image(systemName: add ? "plus" : "minus")
               .resizable()
               .scaledToFit()
               .foregroundColor(.white)
               .frame(width: 25, height: 25)
               .padding(18)
       }
       .background(.blue)
           .cornerRadius(50)
    }
}

#Preview {
    IMCView()
}
