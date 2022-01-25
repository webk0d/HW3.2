//
//  SliderColorView.swift
//  HW3.2
//
//  Created by Сергей Чумаков on 25.01.2022.
//

import SwiftUI

struct SliderColorView: View {
    
    @Binding var value: Double
    @State private var textValue = ""
    
    var accentColor: Color
    
    var body: some View {
        HStack {
            TextView(value: $value)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColor)
                .onChange(of: value) { onFocus in
                    textValue = "\(lround(onFocus))"
                }
            
            TextFildView(textValue: $textValue, value: $value)
        }
        .onAppear {
            textValue = "\(lround(value))"
        }
    }
}

struct SliderColorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            SliderColorView(value: .constant(82), accentColor: .red)
        }
    }
}


