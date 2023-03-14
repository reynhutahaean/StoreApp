//
//  ResponseModel.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import Foundation

struct ResponseModel: Decodable {
    let products: [ProductModel]?
    let total: Int?
    var skip: Int?
    var limit: Int?
}
