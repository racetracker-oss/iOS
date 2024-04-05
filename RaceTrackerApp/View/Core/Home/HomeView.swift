//
//  HomeView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

struct HomeView: View {
   
    var body: some View {
        ScrollView{
            Text("Hello")
                .font(.largeTitle)
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    ZStack{
        Color.backGround.ignoresSafeArea()
        HomeView()
    }
}
