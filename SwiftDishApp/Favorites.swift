//
//  Favorites.swift
//  SwiftDishApp
//
//  Created by Isc. Torres on 3/20/20.
//  Copyright © 2020 isctorres. All rights reserved.
//

import SwiftUI

class Favorites : ObservableObject{
    @Published var items = [MenuItem]() // Publish nos permite notificar a las vistas que se actualicen cuando hay un cambio en la coleccion "items"

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
