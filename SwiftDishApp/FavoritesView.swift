//
//  FavoritesView.swift
//  SwiftDishApp
//
//  Created by Isc. Torres on 3/20/20.
//  Copyright © 2020 isctorres. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorite : Favorites
    
    var body: some View {
        NavigationView{
            List{
                ForEach(favorite.items){ section in
                    ItemView(item: section)
                }
            }
            .navigationBarTitle("Favorites")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let favorite = Favorites()
    static var previews: some View {
        FavoritesView().environmentObject(favorite)
    }
}
