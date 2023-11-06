//
//  MealsResponse.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 10/31/23.
//

import Foundation

struct MealsResponse<T: Codable>: Codable {
    let meals: [T]
}
