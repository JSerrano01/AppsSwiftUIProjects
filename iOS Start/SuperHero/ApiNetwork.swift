//
//  ApiNetwork.swift
//  iOS Start
//
//  Created by Jaime Serrano on 10/11/24.
//

import Foundation

class ApiNetwork {
    
    struct Wrapper:Codable{
        let response:String
        let results:[SuperHero]
    }
    
    struct SuperHero:Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperHero
    }
    
    struct ImageSuperHero:Codable{
        let url:String
    }
    
    func getHerosByQuery(query:String) async throws -> Wrapper{
        let url = URL(string:"https://superheroapi.com/api/2012f1445121efa9452af153c4dabd1d/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getHeroById(id:String) async throws -> SuperheroCompleted{
        let url = URL(string:"https://superheroapi.com/api/2012f1445121efa9452af153c4dabd1d/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let superhero = try JSONDecoder().decode(SuperheroCompleted.self, from: data)
        return superhero
    }
    
    struct SuperheroCompleted:Codable{
        let id:String
        let name:String
        let image:ImageSuperHero
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct Powerstats:Codable{
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power:String
        let combat:String
    }
    
    struct Biography:Codable{
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        enum CodingKeys:String, CodingKey{
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
            case fullName = "full-name"
        }
        
    }
}
