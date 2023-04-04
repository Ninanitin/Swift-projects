//
//  ContentView.swift
//  Lab5
//
//  Created by Nina Kamble on 3/24/23.
//


import SwiftUI
import CoreLocation
import MapKit


struct ContentView: View
{
    
    
    @StateObject var cityModel: CityViewModel = CityViewModel()

    @State var addCity:String = ""
    @State var addCityDescription:String = ""
    @State var deleteCity:String = ""
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                ToolView(addCity: $addCity, addDescription: $addCityDescription, deleteCity: $deleteCity, cModel: cityModel)
                ListView(cityVM: cityModel)
            }.padding()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Cities Info")
        }
        
        
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct MapView: View
{
    @State var city:String = "Phoenix"
    @State private var region = MKCoordinateRegion()
    @State private var markers = [Location(name: "Phoenix", coordinate: CLLocationCoordinate2D())]
    @State private var searchText = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region, interactionModes: .all, annotationItems: markers) { location in
                MapMarker(coordinate: location.coordinate)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(city) { placemarks, error in
                if let placemark = placemarks?.first, let location = placemark.location {
                    region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                    markers = [Location(name: city, coordinate: location.coordinate)]
                }
            }
        }
        .overlay(searchBar, alignment: .top)
        if let location = markers.first?.coordinate
        {
            Text("Longitude: \(location.longitude)")
            Text("Latitude: \(location.latitude)")
        }
    }

    private var searchBar: some View {
        HStack {
            Button {
                let searchRequest = MKLocalSearch.Request()
                searchRequest.naturalLanguageQuery = searchText
                searchRequest.region = region

                MKLocalSearch(request: searchRequest).start { response, error in
                    guard let response = response else {
                        print("Error: \(error?.localizedDescription ?? "Unknown error").")
                        return
                    }
                    region = response.boundingRegion
                    markers = response.mapItems.map { item in
                        Location(name: item.name ?? "", coordinate: item.placemark.coordinate)
                    }
                }
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 12)
            }
            TextField("Search", text: $searchText)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

struct ToolView:View
{
    @State var showAddAlert:Bool = false
    @State var showDeleteAlert:Bool = false
    
    @Binding var addCity:String
    @Binding var addDescription:String
    
    @Binding var deleteCity:String
    
    @ObservedObject var cModel:CityViewModel
    
    var body: some View
    {
        Text("").toolbar
        {
            ToolbarItem(placement: .navigationBarTrailing)
            {
                Button(action:
                {
                    showAddAlert = true
                    
                },
                label:
                {
                    Text("+")
                    
                }).alert("Search", isPresented:$showAddAlert, actions:
                {
                    TextField("Add new City",text: $addCity)
                    Spacer()
                    TextField("Describe new City", text: $addDescription)
                    
                    Button("Add",action:
                    {
                        cModel.addCity(name: addCity, description: addDescription)
                        print(cModel.getKeys().sorted())
                        
                        showAddAlert = false
                        addCity = ""
                        addDescription = ""
                        
                    })
                    Button("Cancel",role: .cancel, action:
                    {
                        showAddAlert = false
                    })
                })
                
            }
            
            
            ToolbarItem(placement: .navigationBarLeading)
            {
                Button(action:
                {
                    showDeleteAlert = true
                    
                },
                label:
                {
                    Image(systemName: "trash")
                    
                }).alert("Delete Record", isPresented:$showDeleteAlert, actions:
                {
                    TextField("Enter city to delete",text: $deleteCity)
                    
                    Button("Delete",action:
                    {
                        cModel.removeCiity(name: deleteCity)
                        print(cModel.getKeys().sorted())
                        
                        deleteCity = ""
                        
                        showDeleteAlert = false
                        
                    })
                    Button("Cancel",role: .cancel, action:
                    {
                        showDeleteAlert = false
                    })
                })
                
            }
            
            
        }
    }
}



struct ListView:View
{
    @ObservedObject var cityVM:CityViewModel
    @State var cityName = ""
    //@State var toInsertView:Bool = false
    //@State var cityName:String = ""
    //@State var cityDescription:String = ""
    
    var body:some View
    {
        
        List(cityVM.getKeys().sorted(), id: \.self)
        { key in
            VStack
            {
                HStack
                {
                    let image = cityVM.getImage(cName: key)
                    Image(image).resizable().scaledToFit().frame(width: 80, height: 100/2)
                    NavigationLink(destination:
                                    //Text("jgvugvugv"))
                                   
                        //cityName = key
                                   MapView(city: key)
                        
                    )
                                    
                    {
                        Text(key)
                    }
                }
            }
        }
    }
}

