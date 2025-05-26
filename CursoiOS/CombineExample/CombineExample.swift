//
//  CombineExample.swift
//  CursoiOS
//
//  Created by Developer on 24/05/25.
//

import SwiftUI

struct CombineExample: View {
    
    
    @ObservedObject var counter = ModeloCombine()
    
    var body: some View {
        VStack {
            Text("Contador = \(counter.counter)")
            Button("Sumar contador") {
                counter.counter += 1
            }
            Text("Al actualizar esta vista(contador) se reinicia el ObservedObject de las vistas hijas que estan observando el mismo elemento").font(.footnote).foregroundColor(.red)
            //se actualiza la vista, se reinicia el counter de la vista 2
            //Observed Object
            CombineExample2().padding(.top, 40)
            
            
            //State Object
            CombineExample3().padding(.top, 40)
            Text("Cuando se actualiza la vista(contador) en la vista padre no se reinicia el StateObject de las vistas hijas").font(.footnote).foregroundColor(.red)
            
            //Environment Object
            CombineExample4().padding(.top, 40)
            CombineExample5().padding(.top, 40)
            Text("Al usar environment Object se reflejan los cambios en todas las vistas que estan accediendo a este (si actualizo en vista 4 se observa en vista 5)").font(.footnote).foregroundColor(.red)
        }.padding(.all, 32)
    }
}

struct CombineExample2: View {
    
    
    @ObservedObject var counter = ModeloCombine()
    
    var body: some View {
        VStack {
            Text("Contador vista 2(ObservedObject) = \(counter.counter)")
            Button("Sumar contador") {
                counter.counter += 1
            }
        }
    }
}

struct CombineExample3: View {
    
    
    @StateObject var counter = ModeloCombine()
    
    var body: some View {
        VStack {
            Text("Contador vista 3(StateObject) = \(counter.counter)")
            Button("Sumar contador") {
                counter.counter += 1
            }
            
        }
    }
}

struct CombineExample4: View {
    
    //Variables inyectadas en el ContentView
    @EnvironmentObject var counter: ModeloCombine
    
    var body: some View {
        VStack {
            Text("Contador vista 4(EnvironmentObject) = \(counter.counter)")
            Button("Sumar contador") {
                counter.counter += 1
            }
            
        }
    }
}

struct CombineExample5: View {
    
    //Variables inyectadas en el ContentView
    @EnvironmentObject var counter: ModeloCombine
    
    var body: some View {
        VStack {
            Text("Contador vista 5(EnvironmentObject) = \(counter.counter)")
            Button("Sumar contador") {
                counter.counter += 1
            }
            
        }
    }
}

#Preview {
    CombineExample()
}
