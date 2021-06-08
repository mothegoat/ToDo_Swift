//
//  Strings.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

class OutputTexts{
    static let instance: OutputTexts = OutputTexts()
    
    private init() {}
    
    let mainMenu = """
Enter number for command:
1.ToDo Items
2.ToDo Categories
3.Make a new ToDo Item
4.Make a new Category
[TO EXIT ENTER END]
"""
    let toDoMenu = """
    Your ToDo items:
    """
    
    let goBack = ""
    
    let invalidCommand = "Your command is invalid"
}
