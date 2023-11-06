//
//  MealCategories.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/2/23.
//

import Foundation

struct MealCategoriesModel: Hashable, Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
}

extension MealCategoriesModel {
    static let defaultCategory = MealCategoriesModel(idCategory: "3",
                                                     strCategory: "Dessert",
                                                     strCategoryThumb: "https://www.themealdb.com/images/category/dessert.png")
}
