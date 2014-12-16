//
//  ReminderViewController.swift
//  Quiz
//
//  Created by Alex Flores on 12/15/14.
//  Copyright (c) 2014 Alex Flores. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        println("ReminderViewController loaded its view.")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        datePicker.minimumDate = NSDate(timeIntervalSinceNow: 60)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        println("Reminder View Dissapeared")
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Set the tab bar item's title
        tabBarItem.title = "Reminder"
        // Put an image on the tab bar item
        tabBarItem.image = UIImage(named: "Time.png")
    }
    convenience override init() {
        self.init(nibName: "ReminderViewController", bundle: nil)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addReminder(sender: AnyObject) {
        let date = datePicker.date
        let note = UILocalNotification()
        
        note.alertBody = "Hypnotize me!"
        note.fireDate = date
        UIApplication.sharedApplication().scheduleLocalNotification(note)
        println("Setting a reminder for \(date)")
    }
   
}
