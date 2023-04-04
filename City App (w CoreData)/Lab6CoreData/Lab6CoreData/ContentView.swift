//
//  ContentView.swift
//  Lab6CoreData
//
//  Created by Nina Kamble on 3/31/23.
//

import SwiftUI
import CoreData
import UIKit

struct ContentView: View {
    // Core Data
    @Environment(\.managedObjectContext) private var viewContext
    
    // Fetch Request
    @FetchRequest(sortDescriptors: [])
    private var cities: FetchedResults<City>
    
    // State Variables
    @State private var showingAddCityView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cities, id: \.self) { city in
                    NavigationLink(destination: CityDetailView(city: city)) {
                        CityRowView(city: city)
                    }
                }
                .onDelete(perform: deleteCities)
            }
            .navigationBarTitle("Cities Visited")
            .navigationBarItems(trailing: Button(action: {
                showingAddCityView.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddCityView) {
                AddCityView().environment(\.managedObjectContext, viewContext)
            }
        }
    }
    
    private func deleteCities(offsets: IndexSet) {
        withAnimation {
            offsets.map { cities[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved error: \(error)")
        }
    }
}

struct CityRowView: View {
    let city: City
    
    var body: some View {
        HStack {
            city.image.map {
                Image(uiImage: UIImage(data: $0 as! Data)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
            }
            Text(city.name ?? "Unknown City")
        }
    }
}

struct CityDetailView: View {
    let city: City
    
    var body: some View {
        VStack {
            city.image.map {
                Image(uiImage: UIImage(data: $0 as! Data)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .cornerRadius(10)
            }
            Text(city.name ?? "Unknown City")
                .font(.title)
            Text(city.desc ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

