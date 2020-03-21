//
//  ItemDetailView.swift
//  SwiftDishApp
//
//  Created by Isc. Torres on 3/3/20.
//  Copyright © 2020 isctorres. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    
    var item: MenuItem
    //@State private var showFavorites = false
    @EnvironmentObject var order : Order    // Recuperamos la referencia del enviromentobect definida en el scene
    @EnvironmentObject var favorite : Favorites
    
    var body: some View {
        VStack(){
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .opacity(0.9)
                    .offset(x: -5, y: -5)
            }
            Text(item.description).padding()
            Button(action:{self.order.add(item: self.item)}){
                HStack{
                    Image(systemName: "checkmark.circle")
                        .font(.title)
                    Text("Order this")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                //.frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.black)
                //.background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                .background(Color.green)
                .cornerRadius(30)
            }
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action:{
                self.favorite.add(item: self.item)
                //self.showFavorites = true
            })
        {
                Image(systemName: "heart.fill")
        }/*.sheet(isPresented: $showFavorites, content: {FavoritesView().environmentObject(self.favorite)})*/
        )
    }
}

