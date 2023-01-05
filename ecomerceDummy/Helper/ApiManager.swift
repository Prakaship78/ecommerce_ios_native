//
//  ApiManager.swift
//  ecomerceDummy
//
//  Created by Prakash on 05/01/23.
//

import UIKit

enum DataError : Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case message(_ error : Error?)
}

//Singleton pattern
// to restrict class fro inheritence then make class final
final class APIManager {
    static let shared  = APIManager()
    
    // to restrict creating an object of class we use private init
    private init(){}
    
    func fetchProducts (_ completion : @escaping (Result<[ProductModel], DataError>) -> Void ) {
        guard let url = URL(string: Constant.API.productURL) else{return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data , error == nil else {
                return completion(.failure(DataError.invalidData))
                
            }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else{
                return completion(.failure(DataError.invalidResponse))
                
            }
            do {
                let products = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(DataError.message(error)))
            }
        }
        
        task.resume()
    }
}
