//
//  ContentView.swift
//  CarRental
//
//  Created by Nina Kamble on 3/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Text("Welcome to Car Rental Services")
                        .font(.title)
                }.padding(.top, 40)
               
                Spacer()
                HStack{
                    Text("Rent on the go..")
                        .font(.title2)
                } .padding(.bottom,10)
                      .padding(.top, 1)
                
                Spacer()
                NavigationLink(destination: OwnerView()) {
                    Text("I am an Owner")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }.padding(.bottom, 10)
                   // .padding(.top, 20)
                
                
                NavigationLink(destination: RenterView()) {
                    Text("I am an Renter")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }.padding(.bottom, 100)
                   //.padding(.top, 10)
                
                //Spacer()
            }.padding()
        }.navigationBarBackButtonHidden(true)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
