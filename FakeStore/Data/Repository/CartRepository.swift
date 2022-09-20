//
//  CartRepository.swift
//  FakeStore
//
//  Created by feri setyo on 16/09/22.
//

import Foundation
import Combine
import Alamofire

protocol CartRepositoryProtocol {
    func fetchCart() -> AnyPublisher<DataResponse<[CartResponse],AFError>, Never>
}

class CartRepository {
    static let shared: CartRepositoryProtocol = CartRepository()
    private init() { }
}

extension CartRepository: CartRepositoryProtocol {
    func fetchCart() -> AnyPublisher<DataResponse<[CartResponse],AFError>, Never> {
        let url = URL(string: "https://fakestoreapi.com/carts")!
        
        return AF.request(url,method: .get)
            .validate()
            .publishDecodable(type: [CartResponse].self)
            .map { response in
                response.mapError { error in
                    return error
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
