//
//  LibraryApp.swift
//  LibraryApp
//
//  Created by Michael Shustov on 18.07.2021.
//

import SwiftUI

@main
struct LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryListView()
                .environmentObject(BookModel())
        }
    }
}
