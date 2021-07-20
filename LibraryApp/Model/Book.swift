//
//  Book.swift
//  LibraryApp
//
//  Created by Michael Shustov on 18.07.2021.
//

import Foundation

struct Book: Decodable, Identifiable {
    
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var content:[String]
}
