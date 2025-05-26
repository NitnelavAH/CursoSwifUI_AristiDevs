//
//  UserDefaultExample.swift
//  CursoiOS
//
//  Created by Developer on 26/05/25.
//

import SwiftUI

struct UserDefaultExample: View {

    @ObservedObject var grid = ModeloColumnas()

    var body: some View {
        NavigationView {

            ScrollView {
                LazyVGrid(columns: grid.gridItem, spacing: 30) {
                    ForEach(lista) { item in
                        Text(item.emoji).font(.system(size: 80))
                    }
                }
            }
        }
        .navigationBarTitle("Grids")
        .toolbar {
            ToolbarItem {
                Menu("Opciones") {
                    Section {
                        Button("1 columna") {
                            grid.columnas(num: 1)
                        }
                        Button("2 columnas") {
                            grid.columnas(num: 2)
                        }
                        Button("3 columnas") {
                            grid.columnas(num: 3)
                        }
                        Button("4 columna") {
                            grid.columnas(num: 4)
                        }
                        Button("Borrar") {
                            UserDefaults.standard.removeObject(forKey: "columnas")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    UserDefaultExample()
}
