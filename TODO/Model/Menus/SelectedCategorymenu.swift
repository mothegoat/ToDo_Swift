//
//  SelectedCategorymenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class SelectedCategoryMenu: Menu {
    
    public static let instance: SelectedCategoryMenu = SelectedCategoryMenu(name: MenuEnum.SELECTEDCATEGORY)
    let controller = Controller.instance
    
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
        print("Title: \(controller.selectedCategory.title)")
        print("Items: ")
        var i = 1
        for item in controller.selectedCategory.todoItems {
            print("  \(i). \(item.title)")
            i += 1
        }
        print("\n SELECT AN ITEM TO DELETE FROM THIS LIST.")
        print(" ENTER *ADD* TO ADD A NEW ITEM TO THIS LIST.")
        print(" ENTER *00* TO GO BACK.")
    }
    
}
