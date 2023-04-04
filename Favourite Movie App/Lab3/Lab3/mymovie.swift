//
//  mymovie.swift
//  Lab3
//
//  Created by Nina Kamble on 2/25/23.
//

import Foundation
class mymovie: ObservableObject
{
    // dictionary that stores person records
    @Published var infoRepository : [String:movieRecord] = [String:movieRecord] ()
    //@Published var mymovie = mymovie()
    init() { }
  
    func add(_ name:String, _ genre:String, _ sale:String)
    {
        let pRecord =  movieRecord(n: name, g:genre, s:sale)
        infoRepository[pRecord.name!] = pRecord
        
    }
    
    func getRecord(p:movieRecord) -> String {
        return "Title: \(p.name!), Genre: \(p.genre!), Sale: \(p.sale!)"
       }
    
    func getCount() -> Int
    {
        return infoRepository.count
    }
    
    func add(p:movieRecord)
    {
        print("adding" + p.name!)
        infoRepository[p.genre!] = p
        
    }
    
    func search(n:String) -> movieRecord?
    {
        var found = false
        
        for (name, _) in infoRepository
        {
            if name == n {
            found = true
                break
            }
        }
        if found
        {
           return infoRepository[n]
        }else  {
     
            return nil
            }
    }
    
    func deleteRec(n:String)
    {
        infoRepository[n] = nil
        
    }
}

