//
//  CustomBarode.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI
import CodeScanner

struct CustomBarode: View {
    @State private var isResult: String = ""
    @State private var isShowingScanner = false
    
    var body: some View {
        VStack{
            if isResult != "" {
                Text("The text is: \(isResult)")
            }
               
            Button(action: {
                isShowingScanner.toggle()
            }, label: {
                TapToScanView()
            })
            .sheet(isPresented: $isShowingScanner, content: {
                CodeScannerView(codeTypes: [.qr]) { result in
                    switch result {
                    case .success(let success):
                        handleScan(result: .success(success))
                    case .failure(let failure):
                        handleScan(result: .failure(failure))
                    }
                }
            })
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 12)
//            )
//            .padding()
        }
    }
    private func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let success):
            self.isResult = success.string
            isShowingScanner = false
        case .failure(let failure):
            print(failure.localizedDescription)

           // isShowingScanner = false
        }
     }
}

#Preview {
    CustomBarode()
}
