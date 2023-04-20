//
//  PlanetModel.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import Foundation

struct PlanetData: Decodable {
    let results : [Planet]
}

struct Planet: Decodable, Identifiable {
    let id = UUID()
    let name: String
}

extension Planet {
    static func mockPlanet() -> Planet {
        return Planet(name: "Tatooine")
    }
}
