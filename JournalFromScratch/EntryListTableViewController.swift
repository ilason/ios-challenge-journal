//
//  EntryListTableViewController.swift
//  JournalFromScratch
//
//  Created by Aaron Eliason on 4/8/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        return cell
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            EntryController.sharedInstance.removeEntry(entry)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toEditEntry" {
            if let detailViewController = segue.destinationViewController as? EntryDetailViewController {
                _ = detailViewController.view
                let indexPath = tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                    let entry = EntryController.sharedInstance.entries[selectedRow]
                    detailViewController.updateWithEntry(entry)
                }
            }
        }
        
    }
}
