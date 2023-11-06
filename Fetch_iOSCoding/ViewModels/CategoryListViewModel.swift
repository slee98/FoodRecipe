//
//  CategoryListViewModel.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/2/23.
//

import Foundation

class CategoryListViewModel: ObservableObject {
    
    // MARK: Properties
    
    let dataManager = MealsDataManager()
    @Published var categories: [MealCategoriesModel] = []
    @Published var isLoading: Bool = false
    @Published var errorOccured: Bool = false
    
    // MARK: Constructor
    
    init() {
        fetchCategoryList()
    }
    
    // MARK: Functions
    
    func fetchCategoryList() {
        print("Fetch Category List Start")
        isLoading = true
        errorOccured = false
        dataManager.getCategories { [weak self] (category, error) in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                if let category = category {
                    self?.categories = category
                } else {
                    self?.errorOccured = true
                    print("Error fetching categories: \(error?.localizedDescription ?? "Unknown Error")")
                }
            }
        }
    }
}
