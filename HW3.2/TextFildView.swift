//
//  TextFildView.swift
//  HW3.2
//
//  Created by Сергей Чумаков on 25.01.2022.
//

import SwiftUI

struct TextFildView: View {
    
    @State private var showAlert = false
    @Binding var textValue: String
    @Binding var value: Double
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            checkValue() }
        .alert("Не верный формат", isPresented: $showAlert, actions: {}) {
            Text("Пожалуйста, введите число от 0 до 255")
        }
        .frame(width: 45, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        
    }
    
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}

struct TextFildView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            TextFildView(textValue: .constant(""), value: .constant(80))
        }
    }
}
