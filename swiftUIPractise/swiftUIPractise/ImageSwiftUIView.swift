//
//  ImageSwiftUIView.swift
//  swiftUIPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import SwiftUI

struct ImageSwiftUIView: View {
    var body: some View {
        
        Image("EmptyHeart")
        .resizable()
            .frame(width: 400.0, height: 300.0)
        
    }
}

struct ImageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSwiftUIView()
    }
}
