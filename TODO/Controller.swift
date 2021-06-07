//
//  Controller.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class Controller {
    public static let instance: Controller = Controller()
    private init() {
        
    }
    
    func addItem(name: String, priority: Int, content: String) -> Void {
        Item(priority: priority, title: name, content: content)
    }
    
    func addCategory(title: String) -> Void {
        Category(title: title)
    }
}
