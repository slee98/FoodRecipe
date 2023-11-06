//
//  ContentView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 10/31/23.
//

import SwiftUI

struct MainView: View {
    
    let mealsViewModel = MealsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                GreetingHeadLineView()
                SearchBarView()
                CategoryListView()
                MealListView()
                
            }
        }
        .environmentObject(mealsViewModel)
    }
}

#Preview {
    let vm = MealsViewModel()
    return MainView()
        .environmentObject(vm)
}
