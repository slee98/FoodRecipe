//
//  MealRowView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 10/31/23.
//

import SwiftUI

struct MealRowView: View {
    
    let meal: Meal
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .frame(width: 160, height: 160)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                } else {
                    ProgressView()
                        .frame(width: 160, height: 160)
                }
            }
            
            Text(meal.strMeal)
                .multilineTextAlignment(.leading)
                .frame(height: 40)
                .bold()
                .font(.system(size: 16))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    MealRowView(meal: Meal(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049"))
}

