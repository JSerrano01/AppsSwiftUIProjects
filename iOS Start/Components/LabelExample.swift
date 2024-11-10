//
//  LabelExample.swift
//  iOS Start
//
//  Created by Jaime Serrano on 8/11/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("EJEMPLO" , image: "swiftImage")
        Label("EJEMPLO" , systemImage: "square.and.arrow.up.circle")
        Label(title: {Text("Label")},
              icon: { Image("swiftImage")
                .resizable()
                .scaledToFit()
                .frame(height: 30)}
        )
    }
}

#Preview {
    LabelExample()
}
