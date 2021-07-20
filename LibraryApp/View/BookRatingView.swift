//
//  BookRatingView.swift
//  LibraryApp
//
//  Created by Michael Shustov on 18.07.2021.
//

import SwiftUI

struct BookRatingView: View {
    
    @EnvironmentObject var model: BookModel
    
    var bookIndex:Int
    
    var body: some View {
        
            VStack {
                
                Spacer()
                
                Text("Read Now!")
                
                Spacer()
                
                NavigationLink(
                    destination: BookContentView(bookIndex: bookIndex),
                    label: {
                        
                        Image("cover\(model.books[bookIndex].id)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 30)
                    })
                
                Spacer()
                
                Text("Mark for later!")
                    .padding(.bottom, 20)
                
                Button(action: {
                    
                    model.books[bookIndex].isFavourite.toggle()
                }, label: {
                    
                    Image(systemName: model.books[bookIndex].isFavourite ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                
                Spacer()
                
                Text("Rate \(model.books[bookIndex].title)")
                    .padding(.bottom, 20)
                
                Picker("Tap me!", selection: $model.books[bookIndex].rating) {
                    
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
                
            }
            .navigationBarTitle("\(model.books[bookIndex].title)")
            .padding(.horizontal, 40)
    }
}

struct BookRatingView_Previews: PreviewProvider {
    static var previews: some View {
        BookRatingView(bookIndex: 0)
            .environmentObject(BookModel())
    }
}
