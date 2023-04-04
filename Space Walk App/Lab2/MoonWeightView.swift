//
//  MoonWeightView.swift
//  Lab2
//
//  Created by Nina Kamble on 2/1/23.
//
import SwiftUI

struct MoonWeightView: View {
    var weight: String
    @State var fromEarth : String = ""
    @State var fromJupiter : String = ""
    @State var fromJupiter2 : String = ""
    
    var body: some View {
        VStack {
            HStack{
                Text("You are on the moon")
                    .font(.largeTitle)
            }.padding(.top, 30)
                .padding(.bottom, 50)
            
            Image("moon").resizable().padding()

            
            HStack{
                Text(fromEarth)
                Text(fromJupiter2)
            }.padding(.bottom, 20)
            
            HStack{
                Text("Your weight on Earth is: ")
                //Spacer()
                Text(weight)
            } .padding(.bottom, 20)
            HStack{
                Text("Your weight on Moon is:")
                //.font(.largeTitle)
                Text("\(calculateMoonWeight(weight: weight))")
                //.font(.title)
            }.padding(.bottom, 20)
            HStack{
                Text("I feel much lighter!")
            }.padding(.bottom, 40)
            
            NavigationLink("Go to Jupiter"){
                JupiterWeightView(weight: weight, fromMoon2: "Coming from moon" )
            }.font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            
            NavigationLink("Go back to Earth"){
                ContentView(fromMoon: "Coming from moon")
            }.font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            
        }.navigationBarBackButtonHidden(true)
    }
    
    
    private func calculateMoonWeight(weight: String) -> String {
        let weightOnEarth = Double(weight) ?? 0
        let weightOnMoon = weightOnEarth * 0.17
        return "\(weightOnMoon) "
    }
}
