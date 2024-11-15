//
//  IMCView.swift
//  iOS Start
//
//  Created by Jaime Serrano on 9/11/24.
//

import SwiftUI

struct IMCView: View {
//    init () {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    @State var gender:Int = 0
    @State var heigth:Double = 150
    @State var age:Int = 18
    @State var weight:Int = 80
    
    var body: some View {
        VStack{
            HStack {
                ToggleButton(text: "Hombre", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $heigth)
            HStack{
                CounterButton(text: "Edad", number: $age)
                CounterButton(text: "Peso", number: $weight)
            }
            IMCCalculateButton(userWeight: Double(weight), userHeight: heigth)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            //.navigationBarBackButtonHidden()
            //.navigationTitle("IMC Calculator")
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("IMC Calculator")
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
}

struct ToggleButton:View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
    var body: some View {
        let color = if( gender == selectedGender){
            Color.backgroundSelectedComponent
        }else{
                Color.backgroundComponent
        }
        Button(action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                //Text(text)
                InformationText(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }
    }
}

struct InformationText:View {
    let text:String
    var body: some View {
        Text(text).font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
}

struct TitleText:View {
    let text:String
    var body: some View {
        Text(text).font(.title2)
            .foregroundColor(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var selectedHeight:Double
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight , in:100...220, step: 1)
                .accentColor(.purple)
                .padding(.horizontal,16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct CounterButton:View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(number))
            HStack{
                Button(action: {
                    if text.lowercased() == "edad"{
                        if number > 0{
                            number -= 1
                        } else{
                            number = number
                        }
                    } else if text.lowercased() == "peso"{
                        if number > 40{
                            number -= 1
                        } else{
                            number = number
                        }
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                Button(action: {
                    if text.lowercased() == "edad"{
                        if number < 100{
                            number += 1
                        } else{
                            number = number
                        }
                    } else if text.lowercased() == "peso"{
                        if number < 150{
                            number += 1
                        } else{
                            number = number
                        }
                    }
                    
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct IMCCalculateButton:View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination:{IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

#Preview {
    IMCView()
    //ToggleButton(text: "Jaime", imageName: "heart.fill", index: 0)
}
