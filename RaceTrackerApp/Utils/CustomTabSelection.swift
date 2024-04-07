//
//  PracticeView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 04/04/2024.
//

import SwiftUI

enum tabItems: Int, Identifiable, CaseIterable {
    case one
    case two
    
    var titleName: String{
        switch self {
        case .one:
            return "Home"
        case .two:
            return "Profile"
        }
    }
    var id: Int { return self.rawValue }
}

struct CustomTabSelection: View {
    @State private var selectedIndex = 0
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            VStack{
                HStack(spacing: 112){
                    ForEach(tabItems.allCases) { section in
                        Button(action: {
                            withAnimation(.snappy) {
                                selectedIndex = section.rawValue
                            }
                        }, label: {
                            Text(section.titleName)
                                .padding()
                                .foregroundStyle(selectedIndex == section.rawValue ? .green : .gray)
                        })
                    }
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width  / CGFloat(tabItems.allCases.count ), height: 4)
                    .offset(x: CGFloat(selectedIndex) * UIScreen.main.bounds.width / CGFloat(tabItems.allCases.count))
                    .padding(.trailing, 195)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    CustomTabSelection()
}

