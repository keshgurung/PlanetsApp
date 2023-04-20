//
//  PlanetsRepository.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import Foundation

protocol PlanetsDataRepository {
    func fetchPlanetsList() async throws -> [Planet]
}

struct PlanetsRepository: JsonDecoder {
    private let serviceManager: RestApiNetworkable
    
    init(serviceManager: RestApiNetworkable) {
        self.serviceManager = serviceManager
    }
}

extension PlanetsRepository: PlanetsDataRepository {
    func fetchPlanetsList() async throws -> [Planet] {
        do {
            let request = PlanetsRequest(path: RestApiEndPoints.planetsPath)
            let data = try await serviceManager.get(request:request)
            let lists = try decode(data:data, to: PlanetData.self)
            return lists.results
        } catch {
            throw error
        }
    }
}
