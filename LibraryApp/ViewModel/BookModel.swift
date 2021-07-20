//
//  BookModel.swift
//  LibraryApp
//
//  Created by Michael Shustov on 18.07.2021.
//

import Foundation

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        
        books = DataService.getLocalData()
    }
}
