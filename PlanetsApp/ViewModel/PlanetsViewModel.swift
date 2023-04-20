//
//  PlanetsViewModel.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import Foundation
import SwiftUI

protocol PlanetsViewModelType: ObservableObject {
    func getPlanetsList(path: String) async
}

enum ViewStates {
    case loading
    case error
    case loaded
    case emptyView
}

@MainActor
final class PlanetsViewModel {
    @Published private(set) var viewState: ViewStates = .loaded
    private(set) var planetsList: [Planet] = []
    private(set) var corePlanetsList: [PlanetEntity] = []
    private let repository: PlanetsDataRepository
    private let coreRepository: CoreDataRepository
    init(repository: PlanetsDataRepository, coreRepository: CoreDataRepository) {
        self.repository = repository
        self.coreRepository = coreRepository
    }
}

extension PlanetsViewModel: PlanetsViewModelType {
    func getPlanetsList(path: String) async {
        viewState = .loading
        do {
            let lists = try await repository.fetchPlanetsList()
            planetsList = lists
            coreRepository.deletePlanets()
            coreRepository.addPlanets(planets: planetsList)
            if planetsList.isEmpty {
                viewState = .emptyView
            }else {
                viewState = .loaded
            }
        } catch {
            self.viewState = .error
            let lists = coreRepository.fetchPlanets()
            corePlanetsList = lists
        }
    }
}
