//
//  Controller.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class Controller {
    public static let instance: Controller = Controller()
    var selectedItem: Item = Item(priority: 1, title: "test", content: "test", addToItems: false)
    var selectedItemIndex: Int = 0
    var selectedCategory: Category = Category(title: "test", addToCategories: false)
    var selectedCategoryIndex: Int = 0
    var selectedCategoryNotIncludedItems = [Item]()
//
//    var currentMenu: Menu = MainMenu.instance
//    var lastMenu: Menu = MainMenu.instance
    var menuOrder = MenuStack()
    
    private init() {}
    
    func addItem(name: String, priority: Int, content: String) -> Void {
        Item(priority: priority, title: name, content: content, addToItems: true)
    }
    
    func addCategory(title: String) -> Void {
        Category(title: title, addToCategories: true)
    }
    
    func sortAA() -> Void {
        Item.allItems.sort{
            $0.title < $1.title
        }
    }
    
    func sortAD() -> Void {
        Item.allItems.sort{
            $1.title < $0.title
        }
    }
    
    func sortPA() -> Void {
        Item.allItems.sort{
            $0.priorityNumber < $1.priorityNumber
        }
    }
    
    func sortPD() -> Void {
        Item.allItems.sort{
            $1.priorityNumber < $0.priorityNumber
        }
    }
    
    func sortTA() -> Void {
        Item.allItems.sort{
            $0.date < $1.date
        }
    }
    
    func sortTD() -> Void {
        Item.allItems.sort{
            $1.date < $0.date
        }
    }
}
