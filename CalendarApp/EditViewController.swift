//
//  DetailViewController.swift
//  CalendarApp
//
//  Created by Carly Hildebrandt on 10/24/15.
//  Copyright © 2015 Carly Hildebrandt. All rights reserved.
//

import UIKit
// Should really be called detailedViewController, this shows all the details/notes of an event
class EditViewController: UIViewController {

    // The event name and notes section
    @IBOutlet weak var EventName: UITextField! = UITextField()
    @IBOutlet weak var NotesSpace: UITextView! = UITextView()
    
    var eventData:NSDictionary = NSDictionary()
    var index = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dont want to be able to edit here, so just display the notes/event name
       EventName?.userInteractionEnabled = false
       NotesSpace?.userInteractionEnabled = false
        // Do any additional setup after loading the view.
        
      EventName?.text = eventData.objectForKey("event") as? String
      NotesSpace?.text = eventData.objectForKey("notes") as? String
        
    }
    
    // allows user to delete event if wanted and updates array
    @IBAction func Delete(sender: AnyObject) {
    
    let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let eventListArray:NSMutableArray! = userDefault.objectForKey("eventList") as? NSMutableArray
    let newList:NSMutableArray = NSMutableArray()
    
    for i:AnyObject in eventListArray! {
        newList.addObject(i as! NSDictionary)
    }
        
        newList.removeObject(eventData)
        userDefault.removeObjectForKey("eventList")
        userDefault.setObject(newList, forKey: "eventList")
        userDefault.synchronize()
        
    self.navigationController?.popToRootViewControllerAnimated(true)
    
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // sends information to the edit/changes view controller so that the person can updat/ change the details of their event
        if (segue.identifier == "EditSegue") {
               // let selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
                let changeViewController = segue.destinationViewController as! ChangesViewController
            changeViewController.eventString = EventName.text!
            changeViewController.notesString = NotesSpace.text!
            changeViewController.eventData = eventData 
            changeViewController.index = index
            
            
        }
    
    }
}
