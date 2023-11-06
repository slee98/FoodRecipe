//
//  ListView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 10/31/23.
//
import SwiftUI

struct MealListView: View {
    
    @EnvironmentObject var mealsViewModel: MealsViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            if mealsViewModel.isLoading {
                ProgressView()
                    .padding()
            } else {
                if !mealsViewModel.errorOccured {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(mealsViewModel.filteredMeal, id: \.self) { meal in
                            NavigationLink(destination: MealDetailView(meal: meal)) {
                                MealRowView(meal: meal)
                            }
                        }
                    }
                    .padding()
                } else {
                    Text("Error Occured.")
                }
            }
        }
    }
}

#Preview {
    let vm = MealsViewModel()
    return MealListView()
        .environmentObject(vm)
}
