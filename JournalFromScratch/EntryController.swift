//
//  EntryController.swift
//  JournalFromScratch
//
//  Created by Aaron Eliason on 4/8/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entriesKey = "entries"
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry]
    
    init() {
        self.entries = []
        self.loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        self.saveToPersistentStorage()
        
    }
    
    func removeEntry (entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }        
    }
    
    func loadFromPersistentStorage() {
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [[String: AnyObject]]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
    }
        func saveToPersistentStorage() {
            let entryDictionaries = self.entries.map({$0.dictionaryCopy})
            NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
        }
}
