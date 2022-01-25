//
//  ColorView.swift
//  HW3.2
//
//  Created by Сергей Чумаков on 25.01.2022.
//

import SwiftUI

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


struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: .constant(90), green: .constant(40), blue: .constant(80))
    }
}
