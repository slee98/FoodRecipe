//
//  DetailView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 10/31/23.
//

import SwiftUI

struct MealDetailView: View {
    
    let meal: Meal
    @ObservedObject var mealDetailViewModel: MealDetailViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    init(meal: Meal) {
        self.meal = meal
        self.mealDetailViewModel = MealDetailViewModel(meal: meal)
    }
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                if let image = phase.image { image
                    .resizable()
                    .frame(width: 400, height: 350)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 0)
                } else {
                    ProgressView()
                        .frame(width: 400, height: 350)
                }
            }
            VStack (alignment: .leading, spacing: 12) {
                Text(meal.strMeal)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                
                if mealDetailViewModel.isLoading {
                    Text("Loading...")
                } else {
                    if !mealDetailViewModel.errorOccured {
                        IngredientsTableView(ingredients: mealDetailViewModel.ingredients ?? [])
                            .padding(.trailing)
                        
                        Text("Directions")
                            .bold()
                            .font(.system(size: 20))
                            .padding(.top)
                        
                        Text(mealDetailViewModel.detail?.strInstructions ?? "")
                            .font(.system(size: 16))
                            .padding(.leading)
                            .padding(.trailing)
                        
                    } else {
                        Text("Error Occured.")
                    }
                }
            }
            .padding(.leading)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .onAppear {
            mealDetailViewModel.fetchMealDetail()
        }
    }
}

#Preview {
    MealDetailView(meal: Meal(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049"))
}
