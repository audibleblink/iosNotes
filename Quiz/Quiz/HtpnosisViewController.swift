//
//  HtpnosisViewController.swift
//  Quiz
//
//  Created by Alex Flores on 12/15/14.
//  Copyright (c) 2014 Alex Flores. All rights reserved.
//

import UIKit

class HtpnosisViewController: UIViewController {

    override func loadView() {
        // Create a view
        let frame          = UIScreen.mainScreen().bounds
        let backgroundView = HypnosisView(frame: frame)
        view               = backgroundView
        // Set it as *the* view of this view controller
    }
    
}
