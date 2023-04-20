//
//  CoreDataRepository.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//


import SwiftUI

protocol CoreDataRepository {
    func addPlanets(planets: [Planet])
    func fetchPlanets() -> [PlanetEntity]
    func deletePlanets()
}

struct CoreRepository: CoreDataRepository {
    
    func addPlanets(planets: [Planet]) {
        DataController.shared.addPlanets(planets: planets)
    }
    
    func fetchPlanets() -> [PlanetEntity] {
        let lists = DataController.shared.fetchPlanets() ?? []
            return lists
    }
    
    func deletePlanets() {
        DataController.shared.deletePlanets()
    }
}
