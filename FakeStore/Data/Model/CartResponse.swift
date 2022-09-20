//
//  CartResponse.swift
//  FakeStore
//
//  Created by feri setyo on 16/09/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cartResponse = try? newJSONDecoder().decode(CartResponse.self, from: jsonData)

import Foundation

// MARK: - CartResponse
struct CartResponse: Codable {
    let id, userID: Int
    let date: String
    let products: [Product]
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case date, products
        case v = "__v"
    }
}

// MARK: - Product
struct Product: Codable {
    let productID, quantity: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case quantity
    }
}
