//
//  BookContentView.swift
//  LibraryApp
//
//  Created by Michael Shustov on 19.07.2021.
//

import SwiftUI

struct BookContentView: View {
    
    @EnvironmentObject var model: BookModel
    
    var bookIndex: Int
    
    @State var page = 0
    
    var body: some View {
        
        TabView (selection: $page) {
            
            ForEach(model.books[bookIndex].content.indices) { i in
                
                VStack {
                    
                    Text(model.books[bookIndex].content[i])
                        .tag(i)
                    
                    Spacer()
                    
                    Text("\(page + 1)")
                }
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            
            model.books[bookIndex].currentPage = page
        })
        .onAppear {
            page = model.books[bookIndex].currentPage
        }
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookContentView(bookIndex: 0)
            .environmentObject(BookModel())
    }
}
