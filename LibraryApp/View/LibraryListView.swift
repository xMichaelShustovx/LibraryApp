//
//  LibraryListView.swift
//  LibraryApp
//
//  Created by Michael Shustov on 18.07.2021.
//

import SwiftUI

struct LibraryListView: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack (alignment: .leading, spacing: 40){
                    
                    ForEach(model.books) {b in
                        
                        NavigationLink(
                            destination: BookRatingView(bookIndex: Int(b.id) - 1),
                            label: {
                                
                                ZStack {
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack (alignment: .leading) {
                                        
                                        HStack {
                                            
                                            Text(b.title)
                                                .bold()
                                                .font(.title)
                                            
                                            Spacer()
                                            
                                            if b.isFavourite {
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .foregroundColor(.yellow)
                                                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            }
                                        }
                                        
                                        Text(b.author)
                                            .italic()
                                        
                                        
                                        Image("cover\(b.id)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    .padding()
                                }
                                .cornerRadius(10)
                                .padding(.horizontal, 20)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.7), radius: 5, x: -5, y: 5)
                                
                            })
                        
                        NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                    }
                    .foregroundColor(.black)
                    .navigationBarTitle("My Library")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryListView()
            .environmentObject(BookModel())
    }
}
