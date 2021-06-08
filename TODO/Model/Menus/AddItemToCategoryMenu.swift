//
//  AddItemToCategoryMenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class AddItemToCategoryMenu: Menu {
    
    public static let instance: AddItemToCategoryMenu = AddItemToCategoryMenu(name: MenuEnum.ADDITEMTOCATEGORY)
    let controller = Controller.instance
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
        let category = controller.selectedCategory
        controller.selectedCategoryNotIncludedItems.removeAll()
        
        print("You can select from one of the items below: ")
        
        var i = 1
        for item in Item.allItems {
            if category.todoItems.contains(item) {
                continue
            }else{
                controller.selectedCategoryNotIncludedItems.append(item)
                print("  -> \(i). \(item.title): \(item.priority)")
                i += 1
            }
        }
        
        print("\n  SELECT AN ITEM TO ADD.")
        print("  ENTER 00 TO GO BACK")
    }
    
}
