//
//  ItemStore.swift
//  Homepwner
//
//  Created by Christian Keur on 10/5/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemStore: NSObject {
    
    var allItems: [Item] = []
    let itemArchivePath: String = {
        let documentsDirectories =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = documentsDirectories.first as String
        return documentDirectory.stringByAppendingPathComponent("items.archive")
    }()
    
    func createItem() -> Item {
        let newItem = Item(random: false)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(item: Item) {
        if let index = find(allItems, item) {
            allItems.removeAtIndex(index)
        }
    }
    

    func saveChanges() -> Bool {
        println("entered")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchivePath)
    }
    
        
    func appDidEnterBackground(note: NSNotification) {
        let success = saveChanges()
        if success {
            println("Saved all of the Items")
        }  else {
            println("Could not save the Items")
        } 
    }



    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return;
        }
        // Get pointer to object being moved so you can re-insert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.removeAtIndex(fromIndex)
        // Insert item in array at new location
        allItems.insert(movedItem, atIndex: toIndex)
    }

    override init() {
        super.init()

        if let archivedItems =
            NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchivePath) as? [Item] {
            allItems += archivedItems
        }

        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self,
            selector: "appDidEnterBackground:",
            name: UIApplicationDidEnterBackgroundNotification,
            object: nil)
    }
}
