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
        self.code = entity.code
        self.name = entity.name
        self.price = entity.price
        if self.code == "KEYCHAIN" {
            self.image = "keychain"
            self.offer = NSLocalizedString("keychain_discount", comment: "")
        } else if self.code == "TSHIRT" {
            self.image = "tshirt"
            self.offer = NSLocalizedString("tshirt_discount", comment: "")
        } else if self.code == "MUG" {
            self.image = "mug"
            self.offer = nil
        } else {
            self.image = nil
            self.offer = nil
        }
    }
    
}
