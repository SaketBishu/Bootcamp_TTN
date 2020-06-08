//
//  TextSwiftUIView.swift
//  swiftUIPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import SwiftUI

struct TextSwiftUIView: View {
    var body: some View {
        Text("This is Custom Text")
            .font(.largeTitle)
            .fontWeight(.bold)
        
    }
}

struct TextSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
                .previewDisplayName("iPhone 8 Plus")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDevice("iPhone 11 Pro")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDevice("iPhone 11 Pro Max")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDevice("iPhone 11")
        }
    }
}

