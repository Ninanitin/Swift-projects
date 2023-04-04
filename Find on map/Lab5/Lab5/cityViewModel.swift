//
//  CityViewModel.swift
//  Lab5
//
//  Created by nkamble on 3/24/23.
//

import Foundation

public class CityViewModel: ObservableObject
{
    @Published var data:[String:City] = [
        "Phoenix":City(cName: "Phoenix", cImage: "phx", cDescription: "Phoenix, Arizona is a sprawling desert metropolis known for its scorching hot summers and diverse cultural offerings."),
        "Los Angeles":City(cName: "Los Angeles", cImage: "la", cDescription: "LA is a sprawling and diverse city in Southern California known for its entertainment industry, beaches, and vibrant cultural scene."),
        "Seattle":City(cName: "Seattle", cImage: "seattle", cDescription: "Also called the big apple"),
        "New York":City(cName: "New York", cImage: "new york", cDescription: "New York City is a bustling metropolis known for its iconic skyline, diverse neighborhoods, and cultural attractions."),
        "Orlando":City(cName: "Orlando", cImage: "orlando", cDescription: "Orlando, Florida is a popular tourist destination known for its theme parks, warm climate, and family-friendly attractions.")
    ]

    func getKeys() -> [String]
    {
        return Array(data.keys)
    }
    
    func getCity(cName:String) -> City?
    {
        return data[cName]
    }
    
    func getImage(cName:String) -> String
    {
        return data[cName]?.getImage() ?? "default"
    }
    
    func getDescription(cName: String) -> String
    {
        return data[cName]?.getDescription() ?? ""
    }
    
    func addCity(name:String, description:String)
    {
        data[name] = City(cName: name, cImage: "default", cDescription: description)
    }

    func removeCiity(name:String)
    {
        data[name] = nil
    }
}

