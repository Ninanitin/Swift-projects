//
//  AccountView.swift
//  CarRental
//
//  Created by Saatvik Rao on 3/19/23.
//

import SwiftUI

struct AccountView: View {
    @State var user: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        
        Text("Hello \(user)").font(.title)
            .padding(.top, 30)
        // .padding(.bottom, )
        
        List {
            ForEach(Car.allCars) { car in
                CarRow(car: car)
            }
        }
        
        Button(action: {
            // Perform action to edit account
        }) {
            Text("Edit Account")
                .font(.headline)
                .padding(.bottom, 30)
                .padding(.top, 10)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        
        Button(action: {
            showingAlert = true
        }) {
            Text("Delete Account")
                .font(.headline)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello"), message: Text("Are you sure you want to delete your account?"), primaryButton: .destructive(Text("Delete")) {
                // Perform action to delete account
            }, secondaryButton: .cancel())
            
            
        }//.navigationBarBackButtonHidden(true)
    }
}
    
    struct CarRow: View {
        let car: Car
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(car.make)
                    .font(.headline)
                Text(car.model)
                    .font(.subheadline)
                Text("$\(car.price)")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
        }
    }
    struct Car: Identifiable {
        let id: UUID = UUID()
        let make: String
        let model: String
        let price: Int
        
        static let allCars = [
            Car(make: "Nissan", model: "Centra", price: 10),
            Car(make: "Honda", model: "Accord", price: 12),
            Car(make: "Ford", model: "Escape", price: 9)
        ]
    }
    
    struct AccountView_Previews: PreviewProvider {
        static var previews: some View {
            AccountView()
        }
    }

