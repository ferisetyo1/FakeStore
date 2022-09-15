//
//  ProductResponse.swift
//  FakeStore
//
//  Created by feri setyo on 15/09/22.

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productResponse = try? newJSONDecoder().decode(ProductResponse.self, from: jsonData)

import Foundation

// MARK: - ProductResponse
struct ProductResponse: Codable {
    let id: Int
    let title: String
    let price: Double
    let productResponseDescription, category: String
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case productResponseDescription = "description"
        case category, image, rating
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

