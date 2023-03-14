//
//  Constant.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import Foundation

class Constant {
    
    private struct Domain {
        static let baseURL = "https://dummyjson.com"
    }
    
    private struct Routes {
        static let products = "/products"
    }
    
    static let BaseURL = Domain.baseURL
    
    static let RoutesHome = Routes.products
}
