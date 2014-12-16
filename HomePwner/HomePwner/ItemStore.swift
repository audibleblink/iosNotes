//
//  ItemStore.swift
//  HomePwner
//
//  Created by Alex Flores on 12/16/14.
//  Copyright (c) 2014 Alex Flores. All rights reserved.
//

import UIKit

class ItemStore: NSObject {
    
    var allItems: [Item] = []
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
}
