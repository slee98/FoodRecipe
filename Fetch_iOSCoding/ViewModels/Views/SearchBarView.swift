//
//  SearchBarView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/4/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @EnvironmentObject var mealsViewModel: MealsViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding()
            TextField("Search", text: $mealsViewModel.searchText)
                .foregroundColor(.black)
                .font(.system(size: 14))
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color(.gray).opacity(0.5), radius: 5, x: 0, y: 0)
        )
        .padding()
    }
}

#Preview {
    let vm = MealsViewModel()
    return SearchBarView()
        .environmentObject(vm)
}
