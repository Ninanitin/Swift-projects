//
//  ContentView.swift
//  Lab2
//
//  Created by Nina Kamble  on 2/1/23.
//
import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State var fromMoon : String = ""
    @State var fromMoon2 : String = ""
    @State var fromJupiter : String = ""
    @State var fromJupiter2 : String = ""


    var body: some View {
        NavigationView {
            VStack {
                
                HStack{
                    Text("Welcome to Space Walk App")
                        .font(.largeTitle)
                }//.padding(.horizontal, 20)
                    .padding(.bottom, 30)
                
                HStack{
                    Text(fromMoon)
                    Text(fromJupiter)
                }.padding(.bottom, 20)
                
                
                HStack{
                    Text("You are on Earth now")
                        .font(.title)
                    //Spacer()
                    //Text(weight)
                } .padding(.bottom,10)
                    .padding(.top, 20)
                
                Image("earth").resizable().padding()

                
                HStack {
                    Text("Weight on Earth:")
                       // .font(.headline)
                    TextField("Enter your weight", text: $weight)
                       // .font(.headline)
                }
                .padding(.bottom, 20)
                
                NavigationLink("Go to the Moon"){
                  MoonWeightView(weight: weight, fromEarth: "Coming from the Earth")
                }.font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
              
            }
            .padding()
        }.navigationBarBackButtonHidden(true)
    }
}
