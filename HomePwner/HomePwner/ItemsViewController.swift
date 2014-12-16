//
//  ItemsViewController.swift
//  HomePwner
//
//  Created by Alex Flores on 12/16/14.
//  Copyright (c) 2014 Alex Flores. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    let itemStore: ItemStore
    
    init(itemStore: ItemStore) {
        self.itemStore = itemStore
        super.init(nibName: nil, bundle: nil)
        
        for _ in 0..<50 {
            self.itemStore.createItem()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ItemCell")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as ItemCell
            
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]

        // Configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        
        if let value = item.valueInDollars {
            cell.valueLabel.text = "$\(value)"
        } else {
            cell.valueLabel.text = ""
        }
        
        return cell
    }
}
