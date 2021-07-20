//
//  DataService.swift
//  LibraryApp
//
//  Created by Michael Shustov on 18.07.2021.
//

import Foundation

class DataService {
    
    static func getLocalData () -> [Book] {
        
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard pathString != nil else {
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let bookData = try decoder.decode([Book].self, from: data)
                
                return bookData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Book]()
    }

}
