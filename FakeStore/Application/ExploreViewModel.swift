//
//  ProdukViewModel.swift
//  FakeStore
//
//  Created by feri setyo on 15/09/22.
//

import Foundation
import Combine
import Alamofire
class ExploreViewModel: ObservableObject {
    
    @Published var products =  [ProductResponse]()
    @Published var categories = [String]()
    @Published var errorText: String = ""
    @Published var selectedCategory: String = "all"
    @Published var showAlert: Bool = false
    @Published var loadingProducts:Bool=false
    @Published var loadingCategories:Bool=false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: ProductRepositoryProtocol
    
    init( dataManager: ProductRepositoryProtocol = ProductRepository.shared) {
        self.dataManager = dataManager
        self.errorText = ""
        getCategories()
        getProductList()
    }
    
    func getProductList() {
        self.loadingProducts = true
        dataManager.fetchProduct(category:self.selectedCategory)
            .sink { (dataResponse) in
                self.loadingProducts = false
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.products = dataResponse.value ?? []
                }
            }.store(in: &cancellableSet)
    }
    
    func getCategories() {
        self.loadingCategories = true
        dataManager.fetchCategories()
            .sink { (dataResponse) in
                self.loadingCategories = false
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.categories = dataResponse.value ?? []
                }
            }.store(in: &cancellableSet)
    }
    
    func createAlert( with error: AFError ) {
        self.errorText = error.localizedDescription
        self.showAlert = true
    }
    
    func selectCategory(category:String){
        self.selectedCategory = category
        cancellableSet.removeAll()
        getProductList()
    }
    
    func createAlertDummy(){
        self.errorText = "hayoo Error"
        self.showAlert = true
    }
}
