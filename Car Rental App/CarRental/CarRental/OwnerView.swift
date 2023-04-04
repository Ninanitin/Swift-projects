//
//  OwnerView.swift
//  CarRental
//
//  Created by Nina Kamble on 3/19/23.
//
import SwiftUI

struct OwnerView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("Welcome!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                NavigationLink("Sign Up") {
                    AccountView(user: "\(username)")
                }
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                
                /*
                 .simultaneousGesture(TapGesture().onEnded{
                 isLoggedIn = username == "username" && password == "password"
                 })
                 */
            }
            .padding()
        }.navigationBarBackButtonHidden(true)
    }
}

struct OwnerView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerView()
    }
}
