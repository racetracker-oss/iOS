//
//  GuideView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 02/04/2024.
//

import SwiftUI

struct GuideView: View {
    @State private var selectedIndex = 0
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            TabView(selection: $selectedIndex){
                GuideView1()
                    .tag(0)
                GuideView2()
                    .tag(1)
                GuideView3()
                    .tag(2)
            }
            .ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
}

struct GuideView1: View {
    var body: some View {
        VStack{
            Text("Welcome to the Race tracker app")
                .font(.title)
                .foregroundStyle(.orange)
                .fontWeight(.heavy)
        }
    }
}

struct GuideView2: View {
    var body: some View {
        VStack{
            Text("This is the guideview2")
                .font(.title)
                .foregroundStyle(.orange)
                .fontWeight(.heavy)
        }
    }
}

struct GuideView3: View {
    var body: some View {
        VStack{
            Text("Here is the guidview 3")
                .font(.title)
                .foregroundStyle(.orange)
                .fontWeight(.heavy)
        }
    }
}



#Preview {
    GuideView()
}
