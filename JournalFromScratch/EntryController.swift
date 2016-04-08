//
//  EntryController.swift
//  JournalFromScratch
//
//  Created by Aaron Eliason on 4/8/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry]
    
    init() {
        self.entries = []
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
    }
    
    func removeEntry (entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
        // not sure if i remember how to do this...come back to it later.
        
    }
}
