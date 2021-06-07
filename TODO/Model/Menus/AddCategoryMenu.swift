//
//  AddCategoryMenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class AddCategoryMenu: Menu {
    
    public static let instance: AddCategoryMenu = AddCategoryMenu(name: MenuEnum.ADDCATEGORY)
    
    override init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
    }
}
