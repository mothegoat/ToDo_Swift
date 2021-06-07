//
//  ItemsMeny.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class ItemsMenu: Menu {
    
    public static let instance: ItemsMenu = ItemsMenu(name: MenuEnum.TODOITEMS)
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
        print("Your ToDo items:")
        var i = 1
        for item in Item.allItems {
            print("\(i). \(item.title): \(item.priority)")
            i += 1
        }
        print("To see the content, enter item's number.")
        print(OutputTexts.instance.goBack)
    }
    
    func itemNotFound() ->  Void{
        print("Item not found.")
    }
}
