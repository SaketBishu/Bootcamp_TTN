//
//  HStackSwiftUIView.swift
//  swiftUIPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import SwiftUI

struct HStackSwiftUIView: View {
    var body: some View {
        
        HStack(alignment: .top, spacing: 20.0) {
            Text("Fist")
                .padding(.all, 20.0)
                .lineLimit(nil)
            
            Text("Second")
                .padding(.all, 20.0)
                .lineLimit(nil)
            
            Text("Three")
                .padding(.all, 20.0)
                .lineLimit(nil)
        }
    }
}

struct HStackSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStackSwiftUIView()
    }
}
