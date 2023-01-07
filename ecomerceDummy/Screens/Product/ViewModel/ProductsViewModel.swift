//
//  ProductsViewModel.swift
//  ecomerceDummy
//
//  Created by Prakash on 07/01/23.
//

import Foundation

final class ProductsViewModel {
    var products : [ProductModel] = []
    var eventHandler : ((_ event : Event) -> Void)? // Data Binding Closure
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { results in
            self.eventHandler?(.stopLoading)
            switch results{
            case.success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case.failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}
// closure approach to bind the data
extension ProductsViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
