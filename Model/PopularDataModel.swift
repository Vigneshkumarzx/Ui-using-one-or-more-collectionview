//
//  PopularDataModel.swift
//  Task
//
//  Created by vignesh kumar c on 11/01/22.
//

import Foundation
import UIKit

struct Popular: Codable {
    let status: Bool?
    let brandsData: [BrandsData]?
    let baseURL: String?

    enum CodingKeys: String, CodingKey {
        case status
        case brandsData = "data"
        case baseURL = "base_url"
    }
}

// MARK: - Datum
struct BrandsData: Codable {
    let id: Int?
    let name, image: String?
    let status: Int?
    let createdAt, updatedAt: String?
    let restaurantID: Int?
    let distance, rating: Double?
    let isOpen: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, image, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case restaurantID = "restaurant_id"
        case distance, rating
        case isOpen = "is_open"
    }
}
