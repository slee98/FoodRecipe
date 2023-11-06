//
//  CategoriesView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/3/23.
//

import SwiftUI

struct CategoryListView: View {
    
    @EnvironmentObject var mealsViewModel : MealsViewModel
    @StateObject var categoryViewModel = CategoryListViewModel()
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categoryViewModel.categories, id: \.self) { category in
                    
                    Button(action: {
                        mealsViewModel.selectedCategory = category
                    }, label: {
                        
                        CategoryRowView(category: category, isSelected: category == mealsViewModel.selectedCategory)
                    })
                }
            }
            .padding(.leading)
        }
    }
}

#Preview {
    let vm = MealsViewModel()
    return CategoryListView(categoryViewModel: CategoryListViewModel())
        .environmentObject(vm)
}
