//
//  ShoppingCartInteractor.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 05/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation

protocol ShoppingCartInteractorInputProtocol: class {
    
    /* Presenter -> Interactor */
    func addProductToCart(product: ProductEntity)
    func getTotalCartAmount()
    func getKeychainsAmount()
    func getTshirtsAmount()
    func getMugsAmount()
    
}

protocol ShoppingCartInteractorOutputProtocol: class {
    
    /* Interactor -> Presenter */
    func updateCart(cartProducts: [ProductEntity]?)
    func updateTotalCartAmount(_ cartAmount: Double)
    func updateKeychainsCartAmount(_ keychainsAmount: Double)
    func updateTshirtsCartAmount(_ tshirtsAmount: Double)
    func updateMugsCartAmount(_ mugsAmount: Double)
    
}

class ShoppingCartInteractor {
    
    weak var presenter: ShoppingCartInteractorOutputProtocol?
    var shoppingCart: [ProductEntity]?
    
}

extension ShoppingCartInteractor: ShoppingCartInteractorInputProtocol {
    
    func addProductToCart(product: ProductEntity) {
        if self.shoppingCart != nil {
            self.shoppingCart?.append(product)
        } else {
            self.shoppingCart = [product]
        }
        self.presenter?.updateCart(cartProducts: self.shoppingCart)
    }
    
    func getTotalCartAmount() {
        self.presenter?.updateTotalCartAmount(self.calculateKeychainsAmount() + self.calculateTshirtsAmount() + self.calculateMugsAmount())
    }
    
    func getKeychainsAmount() {
        self.presenter?.updateKeychainsCartAmount(self.calculateKeychainsAmount())
    }
    
    func getTshirtsAmount() {
        self.presenter?.updateTshirtsCartAmount(self.calculateTshirtsAmount())
    }
    
    func getMugsAmount() {
        self.presenter?.updateMugsCartAmount(self.calculateTshirtsAmount())
    }
    
}

// Private methods
extension ShoppingCartInteractor {

    func calculateKeychainsAmount() -> Double {
        if let shoppingCart = self.shoppingCart {
            let keychains = shoppingCart.filter( { $0.code == "KEYCHAIN" } )
            if let firstKeychain = keychains.first, let keychainPrice = Double(firstKeychain.price) {
                if keychains.count % 2 == 0 {
                    return keychainPrice * Double(keychains.count) / 2
                } else {
                    return (keychainPrice * Double(keychains.count - 1) / 2) + keychainPrice
                }
            }
            return 0
        }
        return 0
    }
    
    func calculateTshirtsAmount() -> Double {
        if let shoppingCart = self.shoppingCart {
            let tshirts = shoppingCart.filter( { $0.code == "TSHIRT" } )
            if let firstTshirt = tshirts.first, let tshirtPrice = Double(firstTshirt.price) {
                if tshirts.count >= 3 {
                    return tshirtPrice * Double(tshirts.count) - tshirtPrice * Double(tshirts.count) * 5/100
                } else {
                    return tshirtPrice * Double(tshirts.count)
                }
            }
            return 0
        }
        return 0
    }
    
    func calculateMugsAmount() -> Double {
        if let shoppingCart = self.shoppingCart {
            let mugs = shoppingCart.filter( { $0.code == "MUG" } )
            if let firstMug = mugs.first, let mugPrice = Double(firstMug.price) {
                return mugPrice * Double(mugs.count)
            }
            return 0
        }
        return 0
    }

}
