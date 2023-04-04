//
//  cityModel.swift
//  Lab5
//
//  Created by nkamble on 3/24/23.
//

import Foundation
class City: ObservableObject
{
    var cityName:String
    var cityImage:String
    var cityDescription:String
    
    init(cName:String, cImage:String, cDescription:String)
    {
        self.cityName = cName
        self.cityImage = cImage
        self.cityDescription = cDescription
    }
    
    func getCityName() -> String
    {
        return cityName
    }
    
    func getDescription() -> String
    {
        return cityDescription
    }
    
    func getImage() -> String
    {
        return cityImage
    }
}
