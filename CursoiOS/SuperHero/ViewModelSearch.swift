//
//  ViewModelSearch.swift
//  CursoiOS
//
//  Created by Developer on 09/05/25.
//

import SwiftUI
import Combine

class HeroSearchViewModel: ObservableObject {
    @Published var search = ""
    @Published var wrapper: ApiNetwork.Wrapper? = nil
    @Published var loading: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        $search
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.searchHeroes(query: query)
            }
            .store(in: &cancellables)
    }

    private func searchHeroes(query: String) {
        guard !query.isEmpty else { return }

        print("Searching for: \(query)")

        loading = true;
        Task {
            do {
                let result = try await ApiNetwork().getHeroesByQuery(query: query)
                for hero in result.results {
                    print("Hero: \(hero.id) - \(hero.name)")
                }
                await MainActor.run {
                    self.wrapper = result
                }
            } catch {
                print("Error fetching:", error)
            }
            loading = false;
        }
    }
}

