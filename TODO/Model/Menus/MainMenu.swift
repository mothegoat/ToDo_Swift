//
//  MainMenu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class MainMenu: Menu {
    
    public static let instance: MainMenu = MainMenu(name: MenuEnum.MAIN)
    
    override private init(name: MenuEnum) {
        super.init(name: name)
    }
    
    override func showMenu() {
        print(OutputTexts.instance.mainMenu)
    }
    
}
