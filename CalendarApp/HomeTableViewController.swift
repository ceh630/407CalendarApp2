//
//  HomeTableViewController.swift
//  CalendarApp
//
//  Created by Carly Hildebrandt on 10/24/15.
//  Copyright © 2015 Carly Hildebrandt. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    // Array to store all of the events that appear in home screen
    var events:NSMutableArray = NSMutableArray();
    // Will load every time
    override func viewDidAppear(animated: Bool) {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let eventListUserDefault:NSMutableArray! = userDefaults.objectForKey("eventList") as? NSMutableArray
        // load and fill table
        if (eventListUserDefault != nil) {
            events = eventListUserDefault
        }
        self.tableView.reloadData()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// added comment
    // MARK: - Table view data source
    
    //Just need one line of text in each cell

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // Keep as many rows as the amount of events currently in array
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    //Display the text of the event/ event title in list
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let eventItem:NSDictionary = events.objectAtIndex(indexPath.row) as! NSDictionary
        cell.textLabel!.text = eventItem.objectForKey("event") as? String

        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        // For when user clicks on an event - prepares for the detailed page
        if (segue.identifier == "ShowSpecificEvent"
            ) {
                let selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
                let specificViewController:EditViewController = segue.destinationViewController as! EditViewController
                specificViewController.eventData = events.objectAtIndex(selectedIndexPath.row) as! NSDictionary
                specificViewController.index = selectedIndexPath.row
                
                
        }
    }

    

}
