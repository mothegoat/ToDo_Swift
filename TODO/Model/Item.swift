//
//  ToDoItem.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class Item: Equatable{
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.priority == rhs.priority && lhs.content == rhs.content && lhs.title == rhs.title
    }
    
    var priority: Priority
    var priorityNumber: Int
    var title: String
    var content: String
    var date: Date
    static var allItems = [Item]()
    
    init(priority: Int, title: String, content: String, addToItems: Bool) {
        self.priority = Item.convertPriorityIntToEnum(priority: priority)
        self.priorityNumber = priority
        self.title = title
        self.content = content
        self.date = Date()
        if(addToItems){
            Item.allItems.append(self)
        }
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
    
    func getTime() -> String {
        return DateFormatter.localizedString(from: date, dateStyle: .long, timeStyle: .medium)
    }
}
