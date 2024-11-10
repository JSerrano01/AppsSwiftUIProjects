//
//  SuperHeroSearcher.swift
//  iOS Start
//
//  Created by Jaime Serrano on 10/11/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    @State var superheroName:String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            TextField("Holi", text: $superheroName, prompt: Text("Superman...").font(.title2).bold().foregroundColor(.gray))
                .foregroundColor(.white)
                .font(.title2)
                .bold()
                .padding(16)
                .border(.purple,width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    Task{
                        do{
                            wrapper = try await ApiNetwork().getHerosByQuery(query: superheroName)
                        }catch{
                            print("ERROR")
                        }
                        loading = false
                    }
                    
                }
            if loading{
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack{
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: SuperHeroDetail(id:superhero.id)){EmptyView()}.opacity(0)
                        }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundApp)
    }
}

struct SuperheroItem:View {
    let superhero:ApiNetwork.SuperHero
    var body: some View {
        ZStack{
            //superhero.image.url
            Rectangle()
            WebImage(url: URL(string:superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack{
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32)
    }
}

#Preview {
    SuperHeroSearcher()
    //SuperheroItem(superhero: ApiNetwork.SuperHero(id: "", name: "Super"))
}
