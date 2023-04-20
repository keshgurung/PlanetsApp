//
//  MockRESTAPIManager.swift
//  PlanetsAppTests
//
//  Created by Kesh Gurung on 19/04/2023.
//

import Foundation
@testable import PlanetsApp

class MockRestAPIManager: RestApiNetworkable {
    var path: String = ""
    func get(request: PlanetsApp.Requestable) async throws -> Data {
        do {
            let bundle = Bundle(for: MockRestAPIManager.self)
            guard !path.isEmpty, let resourcePath = bundle.url(forResource: path, withExtension: "json") else
            {
                throw RestApiCallError.apiError
            }
            let data = try Data(contentsOf: resourcePath)
            return data
        } catch {
            throw RestApiCallError.dataNotFound
        }
    }
}
