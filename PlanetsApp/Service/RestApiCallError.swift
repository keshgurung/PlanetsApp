//
//  RestApiCallError.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import Foundation

enum RestApiCallError:Error {
    case invalidRequest
    case apiError
    case dataNotFound
    case responseError
    case parsingError
    case invalidResponse
}
