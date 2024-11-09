//
//  ImageExample.swift
//  iOS Start
//
//  Created by Jaime Serrano on 1/11/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftImage")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
        
        Image(systemName: "square.and.arrow.up.circle")
            .resizable()
            .scaledToFill()
            .frame(width: 150 , height: 150)
    }
}

#Preview {
    ImageExample()
}
