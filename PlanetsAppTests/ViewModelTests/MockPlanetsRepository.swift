//
//  MockPlanetsRepository.swift
//  PlanetsAppTests
//
//  Created by Kesh Gurung on 19/04/2023.
//

import Foundation
@testable import PlanetsApp

class MockPlanetsRepository: PlanetsDataRepository {

    private var planets: [Planet] = []
    private var error: RestApiCallError?

    func enqueuResponse(planets: [Planet]) {
        self.planets = planets
    }
    func enqueuError(error: RestApiCallError) {
        self.error = error
    }
    func fetchPlanetsList() async throws -> [PlanetsApp.Planet] {
        if error != nil {
            throw error!
        }
        return planets
    }
}
