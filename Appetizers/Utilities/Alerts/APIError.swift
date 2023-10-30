//
//  APIError.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 30/10/2023.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
