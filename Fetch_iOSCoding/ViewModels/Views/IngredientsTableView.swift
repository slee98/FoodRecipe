//
//  IngredientsView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/4/23.
//

import SwiftUI

struct IngredientsTableView: View {
    
    let ingredients: [IngredientModel]
    
    init(ingredients: [IngredientModel]) {
        self.ingredients = ingredients
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12) {
            Text("Ingredients")
                .bold()
                .font(.system(size: 20))
            
            ForEach(ingredients, id: \.self) { ingredient in
                HStack {
                    Text(ingredient.ingredientName)
                        .padding(.leading)
                    Spacer()
                    Text(ingredient.measurement)
                        .padding(.trailing)
                }
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
            }
        }
    }
}

#Preview {
    let ingredients = (1...10).map { IngredientModel(ingredientName: "Ingredient\($0)", measurement: "Measurement\($0)") }
    return IngredientsTableView(ingredients: ingredients)
}
