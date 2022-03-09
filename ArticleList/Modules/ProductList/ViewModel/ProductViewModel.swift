//
//  ProductViewModel.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 05/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation

struct ProductViewModel {
    
    let code: String
    let name: String
    let price: String
    let image: String?
    let offer: String?
    
    init(entity: ProductEntity) {
        code = entity.code
        name = entity.name
        price = entity.price
        if code == "KEYCHAIN" {
            image = "keychain"
            offer = NSLocalizedString("keychain_discount", comment: "")
        } else if code == "TSHIRT" {
            image = "tshirt"
            offer = NSLocalizedString("tshirt_discount", comment: "")
        } else if code == "MUG" {
            image = "mug"
            offer = nil
        } else {
            image = nil
            offer = nil
        }
    }
    
}
