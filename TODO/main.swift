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
//var currentMenu: Menu = MainMenu.instance

print(controller.currentMenu.showMenu())

while input.lowercased() != "end" {
    
    if(!skipInput()){
        input = readLine()!
    }
    
    if(controller.currentMenu === MainMenu.instance){
        switch input {
        case "1":
            controller.lastMenu = controller.currentMenu
            controller.currentMenu = ItemsMenu.instance
        case "2":
            controller.lastMenu = controller.currentMenu
            controller.currentMenu = CategoriesMenu.instance
        case "3":
            controller.lastMenu = controller.currentMenu
            controller.currentMenu = AddItemMenu.instance
        case "4":
            controller.lastMenu = controller.currentMenu
            controller.currentMenu = AddCategoryMenu.instance
        default:
            controller.currentMenu.commandNotFound()
        }
    }else if (controller.currentMenu === ItemsMenu.instance){
        if(input == "00"){
            controller.currentMenu = controller.lastMenu
        }else{
            if(!input.isNumber){
                controller.currentMenu.commandNotFound()
            }else{
                inputInInt = Int(input)!
                if(inputInInt > Item.allItems.count){
                    print(ItemsMenu.instance.itemNotFound())
                }else{
                    let item = Item.allItems[inputInInt - 1]
                    controller.selectedItem = item
                    controller.selectedItemIndex = inputInInt - 1
                    controller.lastMenu = controller.currentMenu
                    controller.currentMenu = SelectedItemMenu.instance
                }
            }
        }
    }else if(controller.currentMenu === SelectedItemMenu.instance){
        if(input == "00"){
            controller.currentMenu = controller.lastMenu
        }else{
        if(!input.isNumber){
            controller.currentMenu.commandNotFound()
        }else{
            inputInInt = Int(input)!
            if(inputInInt < 1 || inputInInt > 4){
                controller.currentMenu.commandNotFound()
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
                            controller.currentMenu = controller.lastMenu
                            break
                        }else if(confirmation.lowercased() == "n"){
                            print("Deletion aborted.")
                            break
                        }else{
                            print("Enter y/n")
                        }
                    }
                }else{
                    controller.currentMenu.commandNotFound()
                }
            }
        }
    }
    }else if(controller.currentMenu === AddItemMenu.instance){
        print("Enter title: ")
        let title = readLine()!
        print("Enter priority(1 -> Low, 2 -> Medium, 3 -> High): ")
        let priority = getItemPriorityFromUser()
        print("Enter content: ")
        let content = readLine()!
        
        controller.addItem(name: title, priority: priority, content: content)
        print ("Item \(title) has been added successfully!")
        controller.currentMenu = controller.lastMenu
    }else if(controller.currentMenu === AddCategoryMenu.instance){
        print("Enter title: ")
        var title = ""
        while(true){
            title = readLine()!
            if Category.allTitles.contains(title) {
                print("This title already exists. Choose another title.")
            }else{
                break
            }
        }
        
        controller.addCategory(title: title)
        print("Category \(title) has been created.")
        controller.currentMenu = controller.lastMenu
    }else if(controller.currentMenu === CategoriesMenu.instance){
        if(input == "00"){
            controller.currentMenu = controller.lastMenu
        }else{
            if(!input.isNumber){
                controller.currentMenu.commandNotFound()
            }else{
                inputInInt = Int(input)!
                if(inputInInt > Category.allCategories.count){
                    print(ItemsMenu.instance.itemNotFound())
                }else{
                    let category = Category.allCategories[inputInInt - 1]
                    controller.selectedCategory = category
                    controller.selectedCategoryIndex = inputInInt - 1
                    controller.currentMenu = SelectedCategoryMenu.instance
                }
            }
        }
    }
    
    controller.currentMenu.showMenu()
}

func skipInput() -> Bool {
    if(controller.currentMenu === AddItemMenu.instance || controller.currentMenu === AddCategoryMenu.instance){
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
