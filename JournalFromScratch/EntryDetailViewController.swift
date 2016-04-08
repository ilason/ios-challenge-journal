//
//  EntryDetailViewController.swift
//  JournalFromScratch
//
//  Created by Aaron Eliason on 4/8/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var entryTextField: UITextView!
    
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let entry = self.entry {
            entry.title = titleTextField.text!
            entry.text = entryTextField.text
            entry.timestamp = NSDate()
            
        } else {
            let newEntry = Entry(title: self.titleTextField.text!, text: self.entryTextField.text)
            EntryController.sharedInstance.addEntry(newEntry)
            self.entry = newEntry
        }
        self.navigationController?.popViewControllerAnimated(true)
        
        
        
    }
    @IBAction func clearButtonTapped(sender: AnyObject) {
        titleTextField.text = ""
        entryTextField.text = ""
        
        
    }
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        self.titleTextField.text = entry.title
        self.entryTextField.text = entry.text
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
