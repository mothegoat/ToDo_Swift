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
}
