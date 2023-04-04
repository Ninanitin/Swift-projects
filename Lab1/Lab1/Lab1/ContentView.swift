//
//  ContentView.swift
//  Lab1
//
//  Created by Nina Kamble on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                NavigationLink(destination: partIView()){
                    Text("Part I")
                }.buttonStyle(PlainButtonStyle())
                Spacer()
                NavigationLink(destination: partIIView()){
                    Text("Part II")
                }.buttonStyle(PlainButtonStyle())
                Spacer()
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
