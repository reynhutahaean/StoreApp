//
//  HomeEntity.swift
//  StoreApp
//
//  Created by Reynaldo Cristinus Hutahaean on 14/03/23.
//

import Foundation

struct ProductModel: Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var price: Int?
    var discountPercentage: Double?
    var rating: Double?
    var stock: Int?
    var brand: String?
    var category: String?
    var thumbnail: String?
    var images: [String]?
}
