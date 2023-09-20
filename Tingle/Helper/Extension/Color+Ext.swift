//
//  Color+Ext.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

extension Color {
    init(hex: String) {
        // Remove the '#' character if present
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedHex = cleanedHex.replacingOccurrences(of: "#", with: "")
        
        // Convert the cleaned hexadecimal string to a UInt32
        var rgb: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgb)
        
        // Extract the red, green, and blue components
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
