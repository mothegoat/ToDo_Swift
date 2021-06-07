//
//  AddItemMenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class AddItemMenu: Menu {
    
    public static let instance: AddItemMenu = AddItemMenu(name: MenuEnum.ADDITEM)
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
    }
    
}
