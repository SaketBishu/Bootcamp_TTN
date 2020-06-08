//
//  VStackSwiftUIView.swift
//  swiftUIPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import SwiftUI

struct VStackSwiftUIView: View {
    var body: some View {
        
        VStack {
            
            Text("Fist")
                .padding(.all, 20.0)
                .lineLimit(nil)
            
            Text("Second")
                .padding(.all, 20.0)
                .lineLimit(nil)
            
            Text("Three")
                .padding(.all, 20.0)
                .lineLimit(nil)
            
            Text("Four")
                .padding(.all, 20.0)
                .lineLimit(nil)
            
            Text("Five")
                .padding(.all, 20.0)
                .lineLimit(nil)
        }
    }
}

struct VStackSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStackSwiftUIView()
    }
}
