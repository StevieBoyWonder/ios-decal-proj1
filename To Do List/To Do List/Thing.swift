//
//  Thing.swift
//  To Do List
//
//  Created by Steven Holman on 10/16/16.
//  Copyright © 2016 Stevie. All rights reserved.
//

import Foundation


class Thing {
    var Title: String!
    var Done: Bool!
    var Time: NSDate?
    
    init(Title: String){
        self.Title = Title
        self.Done = false
    }
    
    func MarkDone(){
        self.Done = true
        self.Time = NSDate()
    }
    func UnMarkDone(){
        self.Done = false
        self.Time = nil
    }
    func CheckTime() -> Bool{
        if self.Time != nil {
            let now = NSDate()
            if now.timeIntervalSince(self.Time as! Date) > 86400.0{
                return true
            }
            
        }
        return false
    }
    
}
