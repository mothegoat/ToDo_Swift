//
//  ItemsSortMenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class ItemsSortMenu: Menu {
    
    public static let instance: ItemsSortMenu = ItemsSortMenu(name: MenuEnum.SORTITEMS)
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
        print(
        """
        SORT OPTIONS:\n  ->AA. ALPHABETICALLY ASCESNDING\n  ->AD. ALPHABETICALLY DESCENDING
          ->PA. PRIOIRITY ASCESNDING\n  ->PD. PRIORITY DESCENDING\n  ->TA. TIME ASCESNDING
          ->TD. TIME DESCENDING
        """)
        print(" TO GO BACK ENTER 00.")
    }
}
