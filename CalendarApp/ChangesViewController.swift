//
//  ChangesViewController.swift
//  CalendarApp
//
//  Created by Carly Hildebrandt on 10/25/15.
//  Copyright © 2015 Carly Hildebrandt. All rights reserved.
//

import UIKit

class ChangesViewController: UIViewController {

    @IBOutlet weak var EventName: UITextField!
    @IBOutlet weak var notes: UITextView!
    var eventString = ""
    var notesString = ""
    var eventData = NSDictionary()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventName.text = eventString
        notes.text = notesString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @IBAction func saveEdits(sender: AnyObject) {
    
    let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let eventList:NSMutableArray! = userDefaults.objectForKey("eventList") as? NSMutableArray
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        let newList:NSMutableArray = NSMutableArray()
        dataSet.setObject(EventName.text!,forKey: "event")
        dataSet.setObject(notes.text!,forKey: "notes")
    
    for i:AnyObject in eventList! {
        newList.addObject(i as! NSDictionary)
    }
        
        // userDefaults.removeObjectForKey("eventList")
        newList.replaceObjectAtIndex(index, withObject: dataSet)
        userDefaults.setObject(newList,forKey: "eventList")
        
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
