//
//  RestApiNetworkable.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import Foundation

protocol RestApiNetworkable {
    func get(request: Requestable) async throws -> Data
}
