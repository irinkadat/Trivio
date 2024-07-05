//
//  Product.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import Foundation

struct Product: Identifiable, Decodable {
    let id: Int
    let name: String
    let price: Int
    let productImage: String
    
    var productImageURL: URL? {
        return URL(string: "https://kopa.ge\(productImage)")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, productImage
        
    }
}
