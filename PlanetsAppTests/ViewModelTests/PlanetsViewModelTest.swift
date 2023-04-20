//
//  PlanetsViewModelTest.swift
//  PlanetsAppTests
//
//  Created by Kesh Gurung on 19/04/2023.
//

import XCTest
@testable import PlanetsApp

final class PlanetsViewModelTest: XCTestCase {
    
    var mockPlanetsRepository: MockPlanetsRepository!
    var planetsViewModel: PlanetsViewModel!
    var coreDataRepository: CoreDataRepository!
    
    @MainActor override func setUp() {
        mockPlanetsRepository = MockPlanetsRepository()
        planetsViewModel =  PlanetsViewModel(repository: mockPlanetsRepository, coreRepository: coreDataRepository)
    }
    
    override func tearDown() {
        mockPlanetsRepository = nil
        planetsViewModel = nil
    }
    
    //when planet list is not empty
    func testGetPlanetsWhenListIsNotEmpty() async {
        
        // Given
        mockPlanetsRepository.enqueuResponse(planets: [Planet.mockPlanet()])
        
        // When
        await planetsViewModel.getPlanetsList(path: "PlanetsAPIResponseData")
        
        // Then
        let empList = await planetsViewModel.planetsList
        XCTAssertEqual(empList.count, 1)
        XCTAssertEqual(empList.first?.name, "Tatooine")
        
        let viewState = await planetsViewModel.viewState
        XCTAssertEqual(viewState, .loaded)
    }
    
    //when planet list is empty
    func testGetPlanetsWhenListIsEmpty() async {
        
        // Given
        mockPlanetsRepository.enqueuResponse(planets: [])
        
        // When
        await planetsViewModel.getPlanetsList(path: "PlanetsAPIResponseData")
        
        // Then
        let empList = await planetsViewModel.planetsList
        XCTAssertEqual(empList.count, 0)
        let viewState = await planetsViewModel.viewState
        XCTAssertEqual(viewState, .emptyView)
    }
    
    
    //when repository throws error for getSchools
    func testGetPlanetsWhenRepositoryThrowsError() async {
        
        // Given
        mockPlanetsRepository.enqueuError(error: RestApiCallError.apiError)
        
        // When
        await planetsViewModel.getPlanetsList(path: "PlanetsAPIResponseData")
        
        // Then
        let empList = await planetsViewModel.planetsList
        XCTAssertEqual(empList.count, 0)
        let viewState = await planetsViewModel.viewState
        XCTAssertEqual(viewState, .error)
    }
}
