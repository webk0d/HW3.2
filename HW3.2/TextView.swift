//
//  TextView.swift
//  HW3.2
//
//  Created by Сергей Чумаков on 25.01.2022.
//

import SwiftUI

struct TextView: View {
    @Binding var value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .foregroundColor(.white)
            .frame(width: 35)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            TextView(value: .constant(90))
        }
    }
}
