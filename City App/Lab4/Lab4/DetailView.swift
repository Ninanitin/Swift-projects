//
//  DetailView.swift
//  Lab4
//
//  Created by Nina Kamble on 3/4/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let city: String
    let descrption: String
    let image: String
    @ObservedObject  var cModel : CityModel
   
    var body: some View {
        Text("\(descrption)")
            .navigationTitle(city)
            .navigationBarTitleDisplayMode(.inline)
        Image("city").resizable().frame(width: 200.0, height: 200.0)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(role: .destructive)
                    {
                        let x = cModel.findCity(city: city)
                        print(x)
                        cModel.removeCity(at: x)
                        dismiss()
                    } label:
                    {
                        Image(systemName: "trash")
                    }

                }
            }
    }
}

