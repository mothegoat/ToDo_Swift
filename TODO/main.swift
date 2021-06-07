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
                    controller.selectedItem = item
                    controller.selectedItemIndex = inputInInt - 1
                    currentMenu = SelectedItemMenu.instance
                }
            }
        }
    }else if(currentMenu === SelectedItemMenu.instance){
        if(input == "00"){
            currentMenu = ItemsMenu.instance
        }else{
        if(!input.isNumber){
            currentMenu.commandNotFound()
        }else{
            inputInInt = Int(input)!
            if(inputInInt < 1 || inputInInt > 4){
                currentMenu.commandNotFound()
            }else{
                if(inputInInt == 1){
                    print("Enter new title: ")
                    let newTitle = readLine()!
                    controller.selectedItem.title = newTitle
                    
                    print("Title has been changed to \(newTitle)")
                }else if(inputInInt == 2){
                    print ("Enter new priority: ")
                    let newPriority = getItemPriorityFromUser()
                    controller.selectedItem.priority = Item.convertPriorityIntToEnum(priority: newPriority)
                    
                    print("Priority has been changed to \(controller.selectedItem.priority)")
                }else if(inputInInt == 3){
                    print("Enter new content: ")
                    let newContent = readLine()!
                    controller.selectedItem.content = newContent
                    
                    print("Priority has been changed to \(newContent)")
                }else if(inputInInt == 4){
                    print("Are you sure you want to delete this item? (y/n)")
                    while(true){
                        let confirmation = readLine()!
                        if(confirmation.lowercased() == "y"){
                            Item.allItems.remove(at: controller.selectedItemIndex)
                            print("Item has been deleted")
                            currentMenu = ItemsMenu.instance
                            break
                        }else if(confirmation.lowercased() == "n"){
                            print("Deletion aborted.")
                            break
                        }else{
                            print("Enter y/n")
                        }
                    }
                }else{
                    currentMenu.commandNotFound()
                }
            }
        }
    }
    }else if(currentMenu === AddItemMenu.instance){
        print("Enter title: ")
        let title = readLine()!
        print("Enter priority(1 -> Low, 2 -> Medium, 3 -> High): ")
        let priority = getItemPriorityFromUser()
        print("Enter content: ")
        let content = readLine()!
        
        controller.addItem(name: title, priority: priority, content: content)
        print ("Item \(title) has been added successfully!")
        currentMenu = MainMenu.instance
    }else if(currentMenu === CategoriesMenu.instance){
        if(input == "00"){
            currentMenu = MainMenu.instance
        }else{
            if(!input.isNumber){
                currentMenu.commandNotFound()
            }else{
                inputInInt = Int(input)!
                if(inputInInt > Category.allCategories.count){
                    print(ItemsMenu.instance.itemNotFound())
                }else{
                    let category = Category.allCategories[inputInInt - 1]
                    controller.selectedCategory = category
                    controller.selectedCategoryIndex = inputInInt - 1
                    currentMenu = SelectedItemMenu.instance
                }
            }
        }
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

func getItemPriorityFromUser() -> Int{
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
    return priority
}


extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
