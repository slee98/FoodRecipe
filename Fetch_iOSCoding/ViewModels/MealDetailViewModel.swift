//
//  MealDetailViewModel.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/1/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    
    // MARK: Properties
    
    let dataManager = MealsDataManager()
    let meal: Meal
    @Published var detail: MealDetailModel?
    @Published var ingredients: [IngredientModel]?
    @Published var isLoading: Bool = false
    @Published var errorOccured: Bool = false
    
    // MARK: Constructor
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    func fetchMealDetail() {
        print("Fetch Detail Data Start")
        isLoading = true
        errorOccured = false
        dataManager.getMeal(withID: meal.idMeal) { [weak self] (meal, error) in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let meal = meal {
                    self?.detail = meal
                    self?.ingredients = self?.getAllIngredients(mealDetail: meal)
                } else {
                    self?.errorOccured = true
                    print("Error fetching meals: \(error?.localizedDescription ?? "Unknown Error")")
                }
            }
        }
    }
    
    // MARK: Functions
    
    func getAllIngredients(mealDetail: MealDetailModel) -> [IngredientModel] {
        let ingredientPrefix = "strIngredient"
        let measurementPrefix = "strMeasure"
        var ingredientsMap = [String: String]()
        var measurementsMap = [String: String]()
        var ingredients = [IngredientModel]()
        
        let mirror = Mirror(reflecting: mealDetail)
        
        for parameter in mirror.children {
            if let label = parameter.label, label.hasPrefix(ingredientPrefix),
               let ingredient = parameter.value as? String, !ingredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                ingredientsMap[label] = ingredient
            }
            
            if let label = parameter.label, label.hasPrefix(measurementPrefix),
               let measurement = parameter.value as? String, !measurement.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                measurementsMap[label] = measurement
            }
        }
        
        for i in 1...20 {
            if let ingredient = ingredientsMap[ingredientPrefix + "\(i)"],
               let measurement = measurementsMap[measurementPrefix + "\(i)"] {
                ingredients.append(IngredientModel(ingredientName: ingredient, measurement: measurement))
            }
        }
        return ingredients
    }
}


