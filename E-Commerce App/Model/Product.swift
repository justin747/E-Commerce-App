//
//  Product.swift
//  Product
//
//  Created by Justin747 on 9/8/21.
//

import SwiftUI

//MARK: - Product Model

struct Product: Identifiable{
    var id = UUID().uuidString
    var productImage: String
    var productTitle: String
    var productPrice: String
    var productBG: Color
    var isLiked: Bool = false
    var productRating: Int
}

var products = [

    Product(productImage: "p1", productTitle: "Air Huarache", productPrice: "$240.0", productBG: Color("shoeBG1"), productRating: 4),
    Product(productImage: "p2", productTitle: "Air Max 97", productPrice: "$260.0", productBG: Color("shoeBG2"), isLiked: true, productRating: 3),
    Product(productImage: "p3", productTitle: "Kyrie 6", productPrice: "$290.0", productBG: Color("shoeBG3"), productRating: 5),
    Product(productImage: "p4", productTitle: "Air Max 270 React", productPrice: "$270.0", productBG: Color("shoeBG4"), productRating: 4),
]

