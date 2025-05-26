//
//  Modelo Columnas.swift
//  CursoiOS
//
//  Created by Developer on 26/05/25.
//

import Combine
import Foundation
import SwiftUI

class ModeloColumnas: ObservableObject {
    @Published var gridItem = [GridItem()]

    func columnas(num: Int) {
        gridItem = Array(
            repeating: .init(
                .flexible(maximum: 80)),
                count: num
            )

        UserDefaults.standard.set(num, forKey: "columnas")
    }

    init() {
        if let num = UserDefaults.standard.object(forKey: "columnas") as? Int {
            print("USER DEFAULT COLUMNS \(num)")
            gridItem = Array(
                repeating: .init(
                    .flexible(maximum: 80)),
                    count: num
                )
        } else {
            gridItem = Array(
                repeating: .init(
                    .flexible(maximum: 80)),
                count: 1
            )
        }
    }
}
