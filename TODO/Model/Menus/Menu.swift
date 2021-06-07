//
//  Menu.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class Menu {
    let name: MenuEnum
    
    init(name: MenuEnum) {
        self.name = name
    }
    
    func showMenu() -> Void {
        preconditionFailure("This method must be overridden")
    }
    
    func commandNotFound() -> Void {
        print("Command not found")
    }
}
