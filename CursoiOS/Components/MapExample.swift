//
//  MapExample.swift
//  CursoiOS
//
//  Created by Developer on 15/05/25.
//

import MapKit
import SwiftUI

struct MapExample: View {

    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 19.287789,
                longitude: -99.6699479
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.05,
                longitudeDelta: 0.05
            )
        )
    )

    var body: some View {

        ZStack {
            
            MapReader { proxy in
                Map(position: $position) {
//                    Marker("Sample Marker",
//                           coordinate: CLLocationCoordinate2D(
//                            latitude: 19.287789,
//                            longitude: -99.6699479
//                           )
//                    )
                    
                    Annotation("Sample Marker",
                           coordinate: CLLocationCoordinate2D(
                            latitude: 19.287789,
                            longitude: -99.6699479
                           )
                    ) {
                        Circle().frame(height: 50)
                    }.annotationTitles(.visible)
                }
                    .mapStyle(
                        .hybrid(
                            elevation: .realistic,
                            showsTraffic: true
                        )
                    )
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("Estamos en: \(context.region)")
                    }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(
                            coord, from: .local
                        ) {
                            withAnimation {
                                position = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(
                                            latitude: coordinates.latitude,
                                            longitude: coordinates.longitude
                                        ),
                                        span: MKCoordinateSpan(
                                            latitudeDelta: 0.05,
                                            longitudeDelta: 0.05
                                        )
                                    )
                                )
                            }
                        }
                    }
                
                        
            }

            VStack {
                Spacer()
                HStack {
                    Button("Ir al sur") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: 18.8439263,
                                        longitude: -99.7033499
                                    ),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.05,
                                        longitudeDelta: 0.05
                                    )
                                )
                            )
                        }
                    }
                    .frame(width: 100)
                    .padding(8)
                    .background(.white)
                    .padding()
      

                    Button("Ir al norte") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: 19.8052159,
                                        longitude: -99.681535
                                    ),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.05,
                                        longitudeDelta: 0.05
                                    )
                                )
                            )
                        }
                    }
                    .frame(width: 100)
                    .padding(8)
                    .background(.white)
                    .padding()
       
                }
            }

        }

    }
}

#Preview {
    MapExample()
}
