//
//  FavPlaces.swift
//  CursoiOS
//
//  Created by Developer on 16/05/25.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 19.287789,
                longitude: -99.6699479
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 1,
                longitudeDelta: 1
            )
        )
    )
    
    @State var places: [Place] = []
    
    @State var showPopUp: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var fav: Bool = false

    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    ForEach(places) { place in
                        Annotation(
                            place.name,
                            coordinate: place.coordinates
                        ) {
                            let color = if place.fav {
                                Color.yellow
                            } else {
                                Color.black
                            }
                            
                            Circle()
                                .stroke(color, lineWidth: 8)
                                .fill(.white)
                                .frame(width: 30, height: 30)

                        }
                    }
                }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(
                            coord, from: .local
                        ) {
                            showPopUp = coordinates
                        }
                    }
            }
            
            if showPopUp != nil {
                let view = VStack {
                    Text("Añadir localización")
                        .font(.title2)
                        .bold()
                    Spacer()
                    TextField("Nombre", text: $name)
                        .padding(.bottom, 8)
                    Toggle("Es favorito?", isOn: $fav)
                    Spacer()
                    Button("Guardar") {
                        
                        savePlace(
                            name: name,
                            fav: fav,
                            coordinates: showPopUp!
                        )
                        clearForm()
                    }.disabled(
                        name.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        )
                        .isEmpty)
                    
                }
                    .padding()
                
                withAnimation(.easeIn(duration: 5)) {
                    CustomDialog(
                        closeDialog: {
                            showPopUp = nil
                        },
                        onDismissOutSide: true,
                        content: view
                    )
                }
            }
            
        }
    }
    
    func savePlace(name: String, fav: Bool,coordinates: CLLocationCoordinate2D) {
        let place = Place(
                name: name,
                coordinates: coordinates,
                fav: fav
            )
        places.append(place)
    }
    
    func clearForm() {
        showPopUp = nil
        name = ""
        fav = false
    }
}

#Preview {
    FavPlaces()
}
