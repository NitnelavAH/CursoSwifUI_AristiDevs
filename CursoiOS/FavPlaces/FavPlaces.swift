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
    @State var showSheet = false
    
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map{ PresentationDetent.fraction($0)}

    
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
                    .overlay {
                        VStack {
                            Button("Show List") {
                                showSheet = true
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(.white)
                            .cornerRadius(16)
                            .padding(16)
                            Spacer()
                        }
                    }
            }
            
            if showPopUp != nil {
                let view = VStack {
                    Text("Añadir localización")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.black)
                    Spacer()
                    TextField("Nombre", text: $name)
                        .padding(.bottom, 8)
                        .foregroundStyle(.backgroundApp)
                    Toggle("Es favorito?", isOn: $fav).foregroundStyle(.backgroundApp)
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
            
        }.sheet(isPresented: $showSheet) {
            ScrollView(.horizontal) {
                LazyHStack {
                    
                    ForEach(places) { place in
                        
                        let color = if place.fav {
                            Color.yellow
                        } else {
                            Color.black
                        }
                        
                        VStack {
                            Text(place.name)
                        }
                        .frame(width: 150, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(color.opacity(0.5), lineWidth: 1)
                        }.shadow(radius: 5)
                        .padding(.horizontal, 8)
                        .onTapGesture {
                            animateCamera(coordinate: place.coordinates)
                            showSheet = false
                        }
                        
                    }
                }
            }.presentationDetents(Set(height))
        }.onAppear {
            loadPlaces()
        }
    }
    
    func savePlace(name: String, fav: Bool,coordinates: CLLocationCoordinate2D) {
        let place = Place(
                name: name,
                coordinates: coordinates,
                fav: fav
            )
        places.append(place)
        savePlaces()
    }
    
    func clearForm() {
        showPopUp = nil
        name = ""
        fav = false
    }
    
    func animateCamera(coordinate: CLLocationCoordinate2D) {
        withAnimation {
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 1,
                        longitudeDelta: 1
                    )
                )
            )
        }
    }
}

#Preview {
    FavPlaces()
}

extension FavPlaces {
    func savePlaces() {
        if let encodeData = try? JSONEncoder().encode(places) {
            UserDefaults.standard.set(encodeData, forKey: "places")
        }
    }
    
    func loadPlaces() {
        if let decodeData = UserDefaults.standard.data(forKey: "places") {
            places = try! JSONDecoder().decode([Place].self, from: decodeData)
        }
    }
}
