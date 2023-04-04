//
//  ContentView.swift
//  Lab4
//
//  Created by Nina Kamble 3/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject  var cityModel = CityModel()
    
    @State var insertView = false
    @State var city = ""
    @State var descrption = ""
    @State var image = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cityModel.data, id: \.id) { city in
                    NavigationLink(destination: DetailView(city: city.name, descrption: city.descrption, image: image, cModel: cityModel)) {
                        HStack{
                            Image(city.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:50)
                                .cornerRadius(20)
                            VStack (alignment: .leading, spacing: 5){
                                
                                Text(city.name)
                                    .fontWeight(.semibold)
                                    .minimumScaleFactor(0.5)
                            }
                        }
                        
                    }
                }
                .onDelete(perform: {IndexSet in
                    cityModel.data.remove(atOffsets: IndexSet)
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("City List Insertion")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let _:City = City(name:"", image: "city")
                
                        insertView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }.alert("Insert", isPresented: $insertView ,actions: {
                TextField("City:", text: $city)
                TextField("Discription:", text: $descrption )
                Button("Insert", action: {
                    let c:City = City(name: city, image: "city", descrption: descrption)
                    cityModel.addCity(city: c)
                    insertView = false
                    })
                Button("Cancel", role: .cancel, action: {
                    insertView = false
                })
            }, message: {
                Text("Please Enter City to Insert")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
