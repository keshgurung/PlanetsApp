//
//  PlanetRepositoryTests.swift
//  PlanetsAppTests
//
//  Created by Kesh Gurung on 19/04/2023.
//

import XCTest
@testable import PlanetsApp

final class PlanetRepositoryTests: XCTestCase {
    var mockRestAPIManager: MockRestAPIManager!
    var planetsRepository: PlanetsRepository!
    
    @MainActor override func setUp() {
        mockRestAPIManager = MockRestAPIManager()
        planetsRepository = PlanetsRepository(serviceManager: mockRestAPIManager)
    }
    
    override func tearDown() {
        planetsRepository = nil
        mockRestAPIManager = nil
    }
    
    // when apiManager return success data
    func testWhenGetPlanetsListSuccess() async {
        mockRestAPIManager.path = "PlanetsAPIResponseData"
        let lists = try! await planetsRepository.fetchPlanetsList()
        XCTAssertNotNil(lists)
        XCTAssertEqual(lists.count, 1)
        XCTAssertEqual(lists.first?.name, "Tatooine")
    }
    
    // when fails, planet list data is not nil but parsing fails due to key mismatching
    func testWhenGetPlanetsListParsingFails() async throws {
        // GIVEN
        mockRestAPIManager.path = "PlanetsAPIResponseDataKeyMisMatch"
        do {
            _ = try await planetsRepository.fetchPlanetsList()
        } catch {
            XCTAssertEqual(error as! RestApiCallError, RestApiCallError.parsingError)
        }
    }
    
    // when fails, networkMangers throws error due to any connection issue.
  func testWhenGeSchoolListWheNetworkMangerThrowsErrorDueToConnectionIssue() async throws {
        // GIVEN
        mockRestAPIManager.path = ""
        do {
            _ = try await planetsRepository.fetchPlanetsList()
        } catch {
            XCTAssertEqual(error as! RestApiCallError, RestApiCallError.dataNotFound)
        }
    }
}

