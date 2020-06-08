//
//  ContentView.swift
//  swiftUIPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Assignment 1"))
                {
                    NavigationLink(destination: TextSwiftUIView()) {
                        Text("Text")
                    }
                    
                    NavigationLink(destination: ImageSwiftUIView()) {
                        Text("Image")
                    }
                    
                    NavigationLink(destination: VStackSwiftUIView()) {
                        Text("Vertical Stack")
                    }
                    
                    NavigationLink(destination: HStackSwiftUIView()) {
                        Text("Horizonal Stack")
                    }
                    
                    NavigationLink(destination: ButtonSwiftUIView()) {
                        Text("Button")
                    }
                    
                    NavigationLink(destination: PickerSwiftUIView()) {
                        Text("Picker")
                    }
                }
            }
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
