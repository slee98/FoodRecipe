//
//  MealsViewModel.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 10/31/23.
//

import Combine
import Foundation

class MealsViewModel: ObservableObject {
    
    // MARK: Properties
    
    let dataManager = MealsDataManager()
    @Published var mealsList: [Meal] = []
    @Published var searchText: String = ""
    @Published var selectedCategory: MealCategoriesModel = MealCategoriesModel.defaultCategory
    @Published var isLoading: Bool = false
    @Published var errorOccured: Bool = false
    
    private var fetchCancellable: AnyCancellable?
    
    var filteredMeal : [Meal] {
        return mealsList.filter { meal in
            meal.strMeal.lowercased().hasPrefix(searchText.lowercased())
        }
    }
    
    // MARK: Constructor
    
    init() {
        setupDataBindings()
    }
    
    // MARK: Functions
    
    private func setupDataBindings() {
        fetchCancellable = $selectedCategory.sink(receiveValue: { [weak self] selectedCategory in
            self?.fetchListData(category: selectedCategory)
        })
    }
    
    func fetchListData(category: MealCategoriesModel) {
        print("Fetch Meal Caategory: \(category.strCategory)")
        isLoading = true
        errorOccured = false
        dataManager.getMealsList(category: category) { [weak self] (meals, error) in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                if let meals = meals {
                    let sortedMeals = meals.sorted { $0.strMeal < $1.strMeal }
                    self?.mealsList = sortedMeals
                } else {
                    self?.errorOccured = true
                    print("Error fetching meals: \(error?.localizedDescription ?? "Unknown Error")")
                }
            }
        }
    }
    
    func getGreetingHeadline() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        if (6...11).contains(hour) {
            return "Good Morning,"
        } else if (12...17).contains(hour) {
            return "Good Afternoon,"
        } else {
            return "Good Evening,"
        }
    }
}


