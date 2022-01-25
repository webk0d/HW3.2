//
//  ContentView.swift
//  HW3.2
//
//  Created by Сергей Чумаков on 23.01.2022.
//

import SwiftUI


struct ContentView: View {
    
    @State private var sliderRed = Double.random(in: 0...255)
    @State private var sliderGreen = Double.random(in: 0...255)
    @State private var sliderBlue = Double.random(in: 0...255)
    
    @FocusState private var focusActive: Bool
    
    var body: some View {
        
        ZStack {
            Color(.systemIndigo).ignoresSafeArea()
            VStack(spacing: 35) {
                ColorView(red: $sliderRed, green: $sliderGreen, blue: $sliderBlue)
                VStack {
                    SliderColorView(value: $sliderRed, accentColor: .red)
                    SliderColorView(value: $sliderGreen, accentColor: .green)
                    SliderColorView(value: $sliderBlue, accentColor: .blue)
                }
                .focused($focusActive)
                .toolbar() {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focusActive = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
