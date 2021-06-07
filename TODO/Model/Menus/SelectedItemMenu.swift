//
//  SelectedItemMenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class SelectedItemMenu: Menu {
    
    public static let instance: SelectedItemMenu = SelectedItemMenu(name: MenuEnum.SELECTEDITEM)
    let controller = Controller.instance
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
        let item = controller.selectedItem
        print("Title: \(item.title)")
        print("Priority: \(item.priority)")
        print("Content: \(item.content)")
        
        print("\n 1. Edit Title \n 2. Edit Priority \n 3. Edit content \n 4. Delete \n 00. Go Back")
    }
}
