//
//  MenuStack.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/8/21.
//

import Foundation

class MenuStack{
    
    private var stack = [Menu]()
    
    init() {}
    
    func push(menu:Menu) -> Void {
        stack.append(menu)
    }
    
    func pop() -> Menu {
        return stack.remove(at: (stack.count - 1))
    }
    
    func getCurrentMenu() -> Menu {
        return stack[stack.count - 1]
    }
    
    func goToNextPage(nextMenu: Menu) -> Void {
        self.push(menu: nextMenu)
    }
    
    func goBack() -> Void {
        self.pop()
//        return self.getCurrentMenu()
    }
}
