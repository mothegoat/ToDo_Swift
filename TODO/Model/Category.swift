//
//  Category.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class Category{
    var todoItems = [Item]()
    var title: String
    static var allCategories = [Category]()
    
    init(title: String, addToCategories: Bool) {
        self.title = title
        if(addToCategories){
            Category.allCategories.append(self)
        }
    }
    
    func addItem(item: Item) -> Void {
        todoItems.append(item)
    }
}
