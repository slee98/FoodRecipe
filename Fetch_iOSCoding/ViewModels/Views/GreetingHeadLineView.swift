//
//  GreetingHeadLineView.swift
//  Fetch_iOSCoding
//
//  Created by Soyeon Lee on 11/3/23.
//

import SwiftUI

struct GreetingHeadLineView: View {
    
    @EnvironmentObject var mealsViewModel: MealsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mealsViewModel.getGreetingHeadline())
                .font(.system(size: 20))
                .foregroundColor(.gray.opacity(0.7))
            
            Text("What are you in the mood to make today?")
                .bold()
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .padding(.top)
    }
}

#Preview {
    let vm = MealsViewModel()
    return GreetingHeadLineView()
        .environmentObject(vm)
}

