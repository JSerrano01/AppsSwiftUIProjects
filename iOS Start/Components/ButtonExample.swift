//
//  ButtonExample.swift
//  iOS Start
//
//  Created by Jaime Serrano on 8/11/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola"){
            print("Holis")
        }
        Button(action: {print("Holis")}, label:{
            Text("Hola")
                .frame(width: 100, height: 50)
                .foregroundColor(.white).background(.blue)
                .cornerRadius(10)})
    }
}

struct Counter:View {
   @State var contadorView = 0
    var body: some View {
        Button(action: {
            contadorView += 1
        }, label:{
            Text("Decir hola las veces de \(contadorView)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .foregroundColor(.white).background(.red)
                .cornerRadius(10)})
    }
}


#Preview {
    Counter()
}
