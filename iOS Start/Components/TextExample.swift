//
//  TextExample.swift
//  iOS Start
//
//  Created by Jaime Serrano on 8/11/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Custom").font(.system(size:40,weight: .light, design: .monospaced)).italic().bold().foregroundColor(.blue)
            Text("Jaime Jaime Jaime Jaime")
                .frame(width: 150)
                .lineLimit(3)
                .lineSpacing(125)
        }
    }
}

#Preview {
    TextExample()
}
