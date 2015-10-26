//
//  AddViewController.swift
//  CalendarApp
//
//  Created by Carly Hildebrandt on 10/24/15.
//  Copyright © 2015 Carly Hildebrandt. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var EventTitle: UITextField! = UITextField()
    @IBOutlet weak var NotesField: UITextView! = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveButton(sender: AnyObject) {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var eventList:NSMutableArray! = userDefaults.objectForKey("eventList") as? NSMutableArray
        
        
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(EventTitle.text!,forKey: "event")
        dataSet.setObject(NotesField.text!,forKey: "notes")
        
        if ((eventList) != nil) {
            let newList:NSMutableArray = NSMutableArray();
            
            for i:AnyObject in eventList! {
                newList.addObject(i as! NSDictionary)
            }
            userDefaults.removeObjectForKey("eventList")
            newList.addObject(dataSet)
            userDefaults.setObject(newList,forKey: "eventList")
        }
        else {
            userDefaults.removeObjectForKey("eventList")
            eventList = NSMutableArray()
            eventList!.addObject(dataSet)
            userDefaults.setObject(eventList,forKey: "eventList")
        }
        
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
