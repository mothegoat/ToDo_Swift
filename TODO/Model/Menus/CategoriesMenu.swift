//
//  CategoriesMenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class CategoriesMenu: Menu {
    
    public static let instance: CategoriesMenu = CategoriesMenu(name: MenuEnum.CATEGORIES)
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
        print("Your ToDo categories:")
        var i = 1
        
        for category in Category.allCategories {
            print("\(i). \(category.title)")
            i += 1
        }
        
        print("To see category items, enter its number")
        print(OutputTexts.instance.goBack)
    }
    
}
