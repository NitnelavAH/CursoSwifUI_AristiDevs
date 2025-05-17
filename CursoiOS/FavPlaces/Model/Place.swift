//
//  Place.swift
//  CursoiOS
//
//  Created by Developer on 16/05/25.
//

import Foundation
import MapKit
struct Place: Identifiable {
    var id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var fav: Bool = false
}
