//
//  Entry.swift
//  JournalFromScratch
//
//  Created by Aaron Eliason on 4/8/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation


class Entry {
    private let kTimestamp = "timestamp"
    private let kTitle = "title"
    private let kText = "text"
    
    
    var timestamp: NSDate
    var title: String
    var text: String
    
    init(timestamp: NSDate = NSDate(), title: String, text: String) {
        self.timestamp = timestamp
        self.title = title
        self.text = text
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let timestamp = dictionary [kTimestamp] as? NSDate,
        title = dictionary [kTitle] as? String,
            text = dictionary [kText] as? String else {return nil}
        self.timestamp = timestamp
        self.title = title
        self.text = text
    }
    
    var dictionaryCopy: [String: AnyObject] {
        let dictionary = [
            kTimestamp: self.timestamp,
            kTitle: self.title,
            kText: self.text
            
        ]
        return dictionary
    }
}