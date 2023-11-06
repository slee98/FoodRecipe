//
//  MealsDataManager.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 10/31/23.
//

import Foundation

class MealsDataManager {
    
    enum DataError: Error {
        case url
    }
    
    // MARK: Properties

    private let baseURL = "https://themealdb.com/api/json/v1/1"
    
    // MARK: Functions

    func getMealsList(category: MealCategoriesModel,
                      completion: @escaping (_ meals: [Meal]?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: "\(baseURL)/filter.php?c=\(category.strCategory)") else {
            completion(nil, DataError.url)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _,  error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(MealsResponse<Meal>.self, from: data)
                completion(response.meals, nil)
            }
            catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    
    func getMeal(withID identifier: String,
                 completion: @escaping (_ meal: MealDetailModel?, _ error: Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)/lookup.php?i=\(identifier)") else {
            completion(nil, DataError.url)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _,  error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let response = try JSONDecoder().decode(MealsResponse<MealDetailModel>.self, from: data)
                completion(response.meals.first, nil)
            }
            catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func getCategories(completion: @escaping (_ meals: [MealCategoriesModel]?, _ error: Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)/categories.php") else {
            completion(nil, DataError.url)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _,  error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                let categories = response.categories
                completion(categories, nil)
            }
            catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}


