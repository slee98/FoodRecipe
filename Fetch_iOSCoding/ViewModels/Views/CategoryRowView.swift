//
//  CategoryRowView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/3/23.
//

import SwiftUI

struct CategoryRowView: View {
    
    let category: MealCategoriesModel
    let isSelected: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: category.strCategoryThumb)) { phase in
                if let categoryImage = phase.image {
                    categoryImage
                        .resizable()
                        .frame(width: isSelected ? 65 : 60,
                               height: isSelected ? 45 : 40)
                }
            }
            
            Text("\(category.strCategory)")
                .bold()
                .foregroundColor(isSelected ? .primary : .secondary)
                .font(.system(size: isSelected ? 14 : 12))
        }
    }
}

#Preview {
    CategoryRowView(category: MealCategoriesModel.defaultCategory, isSelected: false)
}
