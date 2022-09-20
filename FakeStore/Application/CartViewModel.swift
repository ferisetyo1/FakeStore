//
//  CartViewModel.swift
//  FakeStore
//
//  Created by feri setyo on 16/09/22.
//

import Foundation
import Combine
import Alamofire
class CartViewModel: ObservableObject {
    
    @Published var carts =  [CartResponse]()
    @Published var errorText: String = ""
    @Published var showAlert: Bool = false
    @Published var loadingCarts:Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: CartRepositoryProtocol
    
    init( dataManager: CartRepositoryProtocol = CartRepository.shared) {
        self.dataManager = dataManager
        self.errorText = ""
        getCarts()
    }
    
    func getCarts() {
        self.loadingCarts = true
        dataManager.fetchCart()
            .sink { (dataResponse) in
                self.loadingCarts = false
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.carts = dataResponse.value ?? []
                }
            }.store(in: &cancellableSet)
    }
    
    func createAlert( with error: AFError ) {
        self.errorText = error.localizedDescription
        self.showAlert = true
    }
}
