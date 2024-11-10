//
//  MenuView.swift
//  iOS Start
//
//  Created by Jaime Serrano on 9/11/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            /*            VStack{
             NavigationLink(destination:IMCView()){
             Text("IMC Calculator")
             }
             Text("App 2")
             Text("App 3")
             Text("App 4")
             }*/
            List{
                NavigationLink(destination:IMCView()){
                    Text("IMC Calculator")
                }
                NavigationLink(destination:SuperHeroSearcher()){
                    Text("Super Hero Finder")
                }
                Text("App 3")
                Text("App 4")
            }
        }
    }
}
#Preview {
    MenuView()
}
