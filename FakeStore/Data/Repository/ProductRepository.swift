//
//  Repository.swift
//  FakeStore
//
//  Created by feri setyo on 15/09/22.
//
import Foundation
import Combine
import Alamofire

protocol ProductRepositoryProtocol {
    func fetchProduct(category:String) -> AnyPublisher<DataResponse<[ProductResponse],AFError>, Never>
    func fetchCategories() -> AnyPublisher<DataResponse<[String],AFError>, Never>
}

class ProductRepository {
    static let shared: ProductRepositoryProtocol = ProductRepository()
    private init() { }
}

extension ProductRepository: ProductRepositoryProtocol {
    func fetchProduct(category:String) -> AnyPublisher<DataResponse<[ProductResponse],AFError>, Never> {
        let stringUrl = category == "all" ? "https://fakestoreapi.com/products":"https://fakestoreapi.com/products/category/"+category.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed)!
        let url = URL(string: stringUrl)!
        
        return AF.request(url,method: .get)
            .validate()
            .publishDecodable(type: [ProductResponse].self)
            .map { response in
                response.mapError { error in
                    return error
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    func fetchCategories() -> AnyPublisher<DataResponse<[String],AFError>, Never> {
        let url = URL(string: "https://fakestoreapi.com/products/categories")!
        
        return AF.request(url,method: .get)
            .validate()
            .publishDecodable(type: [String].self)
            .map { response in
                response.mapError { error in
                    return error
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
