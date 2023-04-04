//
//  ContentView.swift
//  Lab3
//
//  Created by Nina Kamble on 2/22/23.
//

import SwiftUI

struct ContentView: View
{
   // @ObservedObject var mymovie = mymovie
   @StateObject var movieapp: mymovie = mymovie()
        
    @State var name:String
    @State var genre:String
    @State var sale:String
    
    @State var searchName:String
    @State var searchGenre:String
    @State var searchSale:String
    
    @State var deleteS:String
        
    var body: some View {
        NavigationView{
            VStack {
                Text("Movie App").font(.largeTitle.lowercaseSmallCaps())
                Spacer()
                
                NaviView(titleN: $name, genreN:$genre, saleN:$sale , deleteN: $deleteS, pModel: movieapp )
                
                dataEnterView(titleD: $name,genreD:$genre, saleD:$sale)
                Spacer()
                Text("Search Results").font(.title2.lowercaseSmallCaps())
                Spacer()
                SearchView(titleS: $searchName, genreS: $searchGenre, saleS: $searchSale)
                Spacer()
                ToolView(searchMovie: "1", sName:$searchName, sGenre:$searchGenre, sSale:$searchSale, pModel: movieapp)

                }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            //.navigationTitle("Movie App")
        }
    }
}

struct NaviView: View
{
    @Binding var titleN:String
    @Binding var genreN:String
    @Binding var saleN:String
    
    @State  var showingDeleteAlert = false
    @Binding  var deleteN: String
    @ObservedObject  var pModel : mymovie
    
    var body: some View
    {
            Text("")
               .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:
                    {
                        print(pModel.getCount())
                        
                        pModel.add(titleN, genreN , saleN)
                    },
                    label: {
                        Image(systemName: "plus.app")
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action:
                    {
                        print(titleN)
                        showingDeleteAlert = true
                    },
                           label: {
                        Image(systemName: "trash")
                    })
                }
               }.alert("Delete Record", isPresented: $showingDeleteAlert, actions: {
                   TextField("Enter movie title", text: $deleteN)

                   Button("Delete", action: {
                       
                       let title = deleteN
                       pModel.deleteRec(n:title)
                       showingDeleteAlert = false
                       
                   })
                   Button("Cancel", role: .cancel, action: {
                       showingDeleteAlert = false
                   })
               }, message: {
                   Text("Please enter Movie title to Search.")
               })
        
        }
    
}


struct ToolView: View
{
    @State  var searchMovie: String
    @State  var showingSearchAlert = false
    
    @Binding var sName: String
    @Binding var sGenre: String
    @Binding var sSale: String

    @State var currentIndex = 0

    @ObservedObject  var pModel : mymovie
    
    @State  var showingNoRecordsFoundDialog = false
    
    var body: some View
    {
        Text("")
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Button(action:
                    {
                            showingSearchAlert = true
                        
                    },
                           label: {
                        Image(systemName:"eye")
                            .scaledToFit()
                    })
                }
                
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button(action:
                    {
                        // Go to the next record
                        /*
                                       currentIndex += 1
                                       
                                       // Check if there are more records
                                       if currentIndex >= pModel.getCount() {
                                           // Display a message
                                           showingNoRecordsFoundDialog = true
                                           return
                                       }
                                       
                                      // Get the data for the next record
                        if let record = pModel.getRecord(p: movieRecord(n: "", g: "", s: "")){
                            sName = record.name ?? "No Record"
                            sGenre = record.genre ?? "No Record"
                            sSale = record.sale ?? "No Record"
                        }
                        else{
                            
                        }
                        */
                                       
                                   
                    },
                           label: {
                        Text("Next")
                    })
                    
                    Spacer()
                    Button(action:
                    {
                        // implement this as an activity
                    },
                           label: {
                        Text("Prev")
                    })
                    Spacer()
                }
            }.alert("Search Record", isPresented: $showingSearchAlert, actions: {
                TextField("Enter Title", text: $searchMovie)

                Button("Search", action: {
                    
                    let name = searchMovie
                    let p =  pModel.search(n: name)
                    if let x = p {
                        sName = x.name!
                        sGenre = x.genre!
                        sSale = x.sale!
                        
                        print("In search")
                    }else{
                        sName = "No Record "
                        sGenre = "No Record"
                        sSale = "No Record"
                        print("No Record")
                    }
                    showingSearchAlert = false
                    
                })
                Button("Cancel", role: .cancel, action: {
                    showingSearchAlert = false
                })
            }, message: {
                Text("Please enter Movie Title to Search.")
            })
    }
    
}

struct dataEnterView: View
{
    @Binding var titleD:String
    @Binding var genreD:String
    @Binding var saleD:String
    
    var body: some View
    {
        HStack{
           
            Text("Movie Title: ")
                .foregroundColor(.blue)
            Spacer()
            TextField("Enter title", text: $titleD)
                .textFieldStyle(.roundedBorder)
                
        }
        
        HStack{
           
            Text("Genre:")
                .foregroundColor(.blue)
            Spacer()
            TextField("Enter genre", text: $genreD)
                .textFieldStyle(.roundedBorder)
                
        }
        
        HStack{
           
            Text("Sale:")
                .foregroundColor(.blue)
            Spacer()
            TextField("Enter sales", text: $saleD)
                .textFieldStyle(.roundedBorder)
                
        }
    }
    
}

struct SearchView: View
{
    
    @Binding var titleS:String
    @Binding var genreS:String
    @Binding var saleS:String

    
    var body: some View
    {
        HStack{
           
            Text("Title:")
                .foregroundColor(.blue)
            Spacer()
            TextField("", text: $titleS)
                .textFieldStyle(.roundedBorder)
                
        }
        
        HStack{
           
            Text("Genre:")
                .foregroundColor(.blue)
            Spacer()
            TextField("", text: $genreS)
                .textFieldStyle(.roundedBorder)
                
        }
        
        HStack{
           
            Text("Sale:")
                .foregroundColor(.blue)
            Spacer()
            TextField("", text: $saleS)
                .textFieldStyle(.roundedBorder)
                
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "Pathaan", genre:"action", sale: "20", searchName: "", searchGenre: "",searchSale: "", deleteS: "")
    }
}
