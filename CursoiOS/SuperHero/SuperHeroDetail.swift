//
//  SuperHeroDetail.swift
//  CursoiOS
//
//  Created by Developer on 09/05/25.
//

import Charts
import SDWebImageSwiftUI
import SwiftUI

struct SuperHeroDetail: View {
    let id: String
    @State var superHero: ApiNetwork.SuperheroCompleted? = nil
    @State var loading: Bool = true
    var body: some View {
        ScrollView {
            
            VStack {
                
                if loading {
                    ProgressView().tint(.white)
                } else if let superHero = superHero {
                    WebImage(url: URL(string: superHero.image.url))
                        .resizable()
                        .indicator(.activity)
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                    
                    Text(superHero.name).font(.title).foregroundColor(.white)
                    ForEach(superHero.biography.aliases, id: \.self) { alias in
                        Text(alias).foregroundColor(.gray).italic()
                    }
                    SuperheroStats(stats: superHero.powerstats)
                    Spacer()
                }
                
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            
            .onAppear {
                Task {
                    do {
                        superHero = try await ApiNetwork().getHeroById(id: id)
                    } catch {
                        superHero = nil
                    }
                    loading = false
                }
            }
        }.background(.backgroundApp)
    }
}

struct SuperheroStats: View {
    let stats: ApiNetwork.Powerstats

    var body: some View {

            
            VStack(alignment: .leading) {
                Chart {
                    sectorMark(for: "Combat", value: Int(stats.combat) ?? 0)
                    sectorMark(for: "Durability", value: Int(stats.durability) ?? 0)
                    sectorMark(
                        for: "Intelligence", value: Int(stats.intelligence) ?? 0)
                    sectorMark(for: "Power", value: Int(stats.power) ?? 0)
                    sectorMark(for: "Speed", value: Int(stats.speed) ?? 0)
                    sectorMark(for: "Strength", value: Int(stats.strength) ?? 0)
                }
            }
            .padding(16)
            .frame(
                maxWidth: .infinity,
                idealHeight: 350
            )
            .cornerRadius(16)
            .padding(24)

    }
}

@ChartContentBuilder
private func sectorMark(for label: String, value: Int) -> some ChartContent {
    SectorMark(
        angle: .value("Count", value),
        innerRadius: .ratio(0.6),
        angularInset: 5
    )
    .cornerRadius(5)
    .foregroundStyle(by: .value("Category", label))
    
}

#Preview {
    SuperHeroDetail(id: "4")
}
