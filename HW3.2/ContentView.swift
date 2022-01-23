//
//  ContentView.swift
//  HW3.2
//
//  Created by Сергей Чумаков on 23.01.2022.
//

import SwiftUI


struct ContentView: View {
    
    @State private var sliderRed = 50.0
    @State private var sliderGreen = 60.0
    @State private var sliderBlue = 70.0
    @State private var sliderRedTF = ""
    @State private var sliderGreenTF = ""
    @State private var sliderBlueTF = ""
    
    var body: some View {
        
        ZStack {
            Color(.systemIndigo)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                ColorView(red: $sliderRed, green: $sliderGreen, blue: $sliderBlue)
                    .padding(.top, 40)
                SliderColorView(value: $sliderRed, valueString: $sliderRedTF, accentColor: .red)
                SliderColorView(value: $sliderGreen, valueString: $sliderGreenTF, accentColor: .green)
                SliderColorView(value: $sliderBlue, valueString: $sliderBlueTF, accentColor: .blue)
                Spacer()
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderColorView: View {
    
    @Binding var value: Double
    @Binding var valueString: String
    
    var accentColor: Color

    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
                .frame(width: 35)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColor)
            TextField("\(lround(value))", text: $valueString)
                .foregroundColor(.white)
                .frame(width: 45, alignment: .trailing)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct ColorView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Color(CGColor(
            red: convertColor(value: red),
            green: convertColor(value: green),
            blue: convertColor(value: blue),
            alpha: 1)
        )
            .frame(height: 180)
            .cornerRadius(30)
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(Color .white, lineWidth: 2))
    }
    
    private func convertColor(value: Double) -> Double { Double(value/255)}
}
