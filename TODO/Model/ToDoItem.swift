//
//  ToDoItem.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class Item{
    var priority: Priority
    var title: String
    var content: String
    
    init(priority: Int, title: String, content: String) {
        self.priority = Item.convertPriorityIntToEnum(priority: priority)
        self.title = title
        self.content = content
    }
    
    static func convertPriorityIntToEnum(priority: Int) -> Priority {
        if(priority == 1){
            return Priority.LOW
        }else if(priority == 2){
            return Priority.MEDIUM
        }else{
            return Priority.HIGH
        }
        
    }
}
