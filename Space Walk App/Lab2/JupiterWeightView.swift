//
//  JupiterWeightView.swift
//  Lab2
//
//  Created by Nina Kamble on 2/1/23.
//

import SwiftUI

struct JupiterWeightView: View {
    var weight: String
    @State var fromJupiter : String = ""
    @State var fromJupiter2 : String = ""

    @State var fromMoon2 : String = ""

    
    var body: some View {
        VStack {
            HStack{
                Text("You are on Jupiter")
                    .font(.largeTitle)
            }.padding(.top, 30)
                .padding(.bottom, 50)
            
            Image("jupiter").resizable().padding()

            
            HStack{
                Text(fromMoon2)
            }.padding(.bottom, 20)
            
            HStack{
                Text("Your weight on Moon is: ")
                //Spacer()
                Text(weight)
            } .padding(.bottom, 20)
            
            HStack{
                Text("Your weight on Jupiter is:")
                // .font(.title)
                Text("\(calculateJupiterWeight(weight: weight))")
                //.font(.title)
            }.padding(.bottom, 20)
            
            HStack{
                Text("I feel heavier!")
            }.padding(.bottom, 40)

            
            
            
            NavigationLink("Go back to Earth"){
              ContentView(fromJupiter: "Coming from jupiter")
            }.font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            
            NavigationLink("Go back to Moon"){
              MoonWeightView(weight: weight, fromJupiter2: "Coming from Jupiter")
            }.font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                    
        }.navigationBarBackButtonHidden(true)
        
    }


    private func calculateJupiterWeight(weight: String) -> String {
        let weightOnEarth = Double(weight) ?? 0
        let weightOnJupiter = weightOnEarth * 2.54
        return "\(weightOnJupiter)"
    }
}

