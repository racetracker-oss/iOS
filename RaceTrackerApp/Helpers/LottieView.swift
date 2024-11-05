//
//  LottieView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 05/04/2024.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}

#Preview {
    LottieView(animationFileName: "Animation - 1712309701482.json", loopMode: .loop)
        //.frame(width: 30,height: 30)
}
