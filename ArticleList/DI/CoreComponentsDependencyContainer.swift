//
//  CoreComponentsDependencyContainer.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Foundation

class CoreComponentsDependencyContainer {
    // For objects whose instance should be shared throughout the app, I have created a lazy global var that is injected where is needed (the instance is not created until it is used the first time)
    private lazy var networkManager = NetworkManager()
}

extension CoreComponentsDependencyContainer: CoreComponentsFactory {
    
    func getNetworkManager() -> NetworkManager {
        return networkManager
    }
    
}
