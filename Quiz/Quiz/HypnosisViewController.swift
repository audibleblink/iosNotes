//
//  HtpnosisViewController.swift
//  Quiz
//
//  Created by Alex Flores on 12/15/14.
//  Copyright (c) 2014 Alex Flores. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Set the tab bar item's title
        tabBarItem.title = "Hypnotize"
        // Put an image on the tab bar item
        tabBarItem.image = UIImage(named: "Hypno.png")
    }
    convenience override init() {
        self.init(nibName: nil, bundle: nil)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        // Create a view
        let frame          = UIScreen.mainScreen().bounds
        let backgroundView = HypnosisView(frame: frame)
        view               = backgroundView
        // Set it as *the* view of this view controller
    }
    
}
