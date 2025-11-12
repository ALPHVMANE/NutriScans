//
//  NetworkError.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-17.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
