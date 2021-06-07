//
//  main.swift
//  TODO
//
//  Created by Mohammad Abolnejadian on 6/7/21.
//

import Foundation

var input = ""
var inputInInt = 0
let controller: Controller = Controller.instance
var outputText: OutputTexts = OutputTexts.instance
//var currentMenuEnum: MenuEnum = MenuEnum.MAIN
var currentMenu: Menu = MainMenu.instance

print(currentMenu.showMenu())

while input.lowercased() != "end" {
    
    if(!skipInput()){
        input = readLine()!
    }
    
    if(currentMenu === MainMenu.instance){
        switch input {
        case "1":
            currentMenu = ItemsMenu.instance
        case "2":
            currentMenu = CategoriesMenu.instance
        case "3":
            currentMenu = AddItemMenu.instance
        case "4":
            currentMenu = AddCategoryMenu.instance
        default:
            currentMenu.commandNotFound()
        }
    }else if (currentMenu === ItemsMenu.instance){
        if(input == "00"){
            currentMenu = MainMenu.instance
        }else{
            if(!input.isNumber){
                currentMenu.commandNotFound()
            }else{
                inputInInt = Int(input)!
                if(inputInInt > Item.allItems.count){
                    print(ItemsMenu.instance.itemNotFound())
                }else{
                    let item = Item.allItems[inputInInt - 1]
                    print("Title: \(item.title)")
                    print("Priority: \(item.priority)")
                    print("Content: \(item.content)")
                }
            }
        }
    }else if(currentMenu === AddItemMenu.instance){
        print("Enter title: ")
        let title = readLine()!
        print("Enter priority(1 -> Low, 2 -> Medium, 3 -> High): ")
        var priority = 1
        while (true){
            let inputPriority = readLine()!
            if(!inputPriority.isNumber){
                print("Enter a number between 1 to 3")
            }else{
                priority = Int(inputPriority)!
                if(priority < 1 || priority > 3){
                    print("Enter a number between 1 to 3")
                }else{
                    break
                }
            }
        }
        print("Enter content: ")
        let content = readLine()!
        
        controller.addItem(name: title, priority: priority, content: content)
        print ("Item \(title) has been added successfully!")
        currentMenu = MainMenu.instance
    }
    
    currentMenu.showMenu()
}

func skipInput() -> Bool {
    if(currentMenu === AddItemMenu.instance || currentMenu === AddCategoryMenu.instance){
        return true
    }else{
        return false
    }
}


extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
