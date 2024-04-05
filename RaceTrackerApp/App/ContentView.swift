//
//  ContentView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

struct ContentView: View {
    //@StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
         //   if viewModel.userSession != nil {
                MainTabView()
                
         //   } else {
            //    LoginView()
              //      .transition(.slide.animation(.linear(duration: 2)))
          //  }
        }
    }
}

#Preview {
    ContentView()
}
