//
//  CityModel.swift
//  Lab4
//
//  Created by Nina Kamble on 3/4/23.
//

import Foundation
struct City: Identifiable
{
    var id = UUID()
    var name = String()
    var image = String()
    var descrption = String()
}

public class CityModel: ObservableObject
{
    @Published var data = [City(name:"Phoenix", image:"phoenix", descrption: "Phoenix, Arizona is a sprawling desert metropolis known for its scorching hot summers and diverse cultural offerings."), City(name:"Los Angeles", image:"los angeles", descrption: "LA is a sprawling and diverse city in Southern California known for its entertainment industry, beaches, and vibrant cultural scene."), City(name:"Seattle", image:"seattle", descrption: "Seattle, Washington is a bustling Pacific Northwest city known for its coffee culture, tech industry, and scenic views of the Puget Sound."), City(name:"New York", image:"new york", descrption: "New York City is a bustling metropolis known for its iconic skyline, diverse neighborhoods, and cultural attractions."), City(name: "Orlando", image: "orlando", descrption: "Orlando, Florida is a popular tourist destination known for its theme parks, warm climate, and family-friendly attractions.")]
    
    var count: Int {
        data.count
    }
    
    func getCity(at index: Int) -> City {
        return data[index]
    }
    
    func addCity(city: City) {
        data.append(city)
    }
    
    func removeCity(at index: Int) {
        data.remove(at: index)
    }
    
    func findCity(city: String) -> Int{
        var loc:Int = 0
        print(city)
        for c in data
        {
            if c.name == city
            {
                break;
              
            }
            loc = loc + 1
            print(loc)
        }
        return loc
    }
}
