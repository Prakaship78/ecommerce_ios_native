//
//  ProductModel.swift
//  ecomerceDummy
//
//  Created by Prakash on 05/01/23.
//

import Foundation

struct ProductModel : Decodable {
    let id: Int
    let title : String
    let price : Float
    let description : String
    let category : String
    let image : String
    let rating : Rating
}

struct Rating : Decodable {
    let rate : Float
    let count : Int
}
