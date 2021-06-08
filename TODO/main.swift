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
controller.menuOrder.goToNextPage(nextMenu: MainMenu.instance)

print(controller.menuOrder.getCurrentMenu().showMenu())

while input.lowercased() != "end" {
    
    if(!skipInput()){
        input = readLine()!
    }
    
    if(controller.menuOrder.getCurrentMenu() === MainMenu.instance){
        switch input {
        case "1":
            controller.menuOrder.goToNextPage(nextMenu: ItemsMenu.instance)
        case "2":
            controller.menuOrder.goToNextPage(nextMenu: CategoriesMenu.instance)
        case "3":
            controller.menuOrder.goToNextPage(nextMenu: AddItemMenu.instance)
        case "4":
            controller.menuOrder.goToNextPage(nextMenu: AddCategoryMenu.instance)
//            controller.lastMenu = controller.currentMenu
//            controller.currentMenu = AddCategoryMenu.instance
        default:
            controller.menuOrder.getCurrentMenu().commandNotFound()
        }
    }else if (controller.menuOrder.getCurrentMenu() === ItemsMenu.instance){
        if(input == "00"){
            controller.menuOrder.goBack()
        }else if(input.lowercased() == "sort"){
            controller.menuOrder.goToNextPage(nextMenu: ItemsSortMenu.instance)
        }else{
            if(!input.isNumber){
                controller.menuOrder.getCurrentMenu().commandNotFound()
            }else{
                inputInInt = Int(input)!
                if(inputInInt > Item.allItems.count){
                    print(ItemsMenu.instance.itemNotFound())
                }else{
                    let item = Item.allItems[inputInInt - 1]
                    controller.selectedItem = item
                    controller.selectedItemIndex = inputInInt - 1
                    controller.menuOrder.goToNextPage(nextMenu: SelectedItemMenu.instance)
                }
            }
        }
    }else if(controller.menuOrder.getCurrentMenu() === ItemsSortMenu.instance){
        if(input == "00"){
            controller.menuOrder.goBack()
        }else{
            if(input.lowercased() == "aa"){
                controller.sortAA()
                print("Sorted alphabetically ascending.")
                controller.menuOrder.goBack()
            }else if(input.lowercased() == "ad"){
                controller.sortAD()
                print("Sorted alphabetically descending.")
                controller.menuOrder.goBack()
            }else if(input.lowercased() == "pa"){
                controller.sortPA()
                print("Sorted prioritically ascending.")
                controller.menuOrder.goBack()
            }else if(input.lowercased() == "pd"){
                controller.sortPD()
                print("Sorted prioritically descending.")
                controller.menuOrder.goBack()
            }else if(input.lowercased() == "ta"){
                controller.sortTA()
                print("Sorted time ascending.")
                controller.menuOrder.goBack()
            }else if(input.lowercased() == "td"){
                controller.sortTD()
                print("Sorted time descending.")
                controller.menuOrder.goBack()
            }else{
                controller.menuOrder.getCurrentMenu().commandNotFound()
            }
        }
    }else if(controller.menuOrder.getCurrentMenu() === SelectedItemMenu.instance){
        if(input == "00"){
            controller.menuOrder.goBack()
        }else{
        if(!input.isNumber){
            controller.menuOrder.getCurrentMenu().commandNotFound()
        }else{
            inputInInt = Int(input)!
            if(inputInInt < 1 || inputInInt > 4){
                controller.menuOrder.getCurrentMenu().commandNotFound()
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
                            controller.menuOrder.goBack()
                            break
                        }else if(confirmation.lowercased() == "n"){
                            print("Deletion aborted.")
                            break
                        }else{
                            print("Enter y/n")
                        }
                    }
                }else{
                    controller.menuOrder.getCurrentMenu().commandNotFound()
                }
            }
        }
    }
    }else if(controller.menuOrder.getCurrentMenu() === AddItemMenu.instance){
        print("Enter title: ")
        let title = readLine()!
        print("Enter priority(1 -> Low, 2 -> Medium, 3 -> High): ")
        let priority = getItemPriorityFromUser()
        print("Enter content: ")
        let content = readLine()!
        
        controller.addItem(name: title, priority: priority, content: content)
        print ("Item \(title) has been added successfully!")
        controller.menuOrder.goBack()
    }else if(controller.menuOrder.getCurrentMenu() === AddCategoryMenu.instance){
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
        controller.menuOrder.goBack()
    }else if(controller.menuOrder.getCurrentMenu() === CategoriesMenu.instance){
        if(input == "00"){
            controller.menuOrder.goBack()
        }else{
            if(!input.isNumber){
                controller.menuOrder.getCurrentMenu().commandNotFound()
            }else{
                inputInInt = Int(input)!
                if(inputInInt > Category.allCategories.count){
                    print(ItemsMenu.instance.itemNotFound())
                }else{
                    let category = Category.allCategories[inputInInt - 1]
                    controller.selectedCategory = category
                    controller.selectedCategoryIndex = inputInInt - 1
                    controller.menuOrder.goToNextPage(nextMenu: SelectedCategoryMenu.instance)
                }
            }
        }
    }else if(controller.menuOrder.getCurrentMenu() === SelectedCategoryMenu.instance){
        if(input == "00"){
            controller.menuOrder.goBack()
        }else{
            if(!input.isNumber){
                if(input.lowercased() == "add"){
                    controller.menuOrder.goToNextPage(nextMenu: AddItemToCategoryMenu.instance)
                }else{
                    controller.menuOrder.getCurrentMenu().commandNotFound()
                }
            }else{
                inputInInt = Int(input)!
                if(inputInInt > controller.selectedCategory.todoItems.count || inputInInt < 1){
                    ItemsMenu.instance.itemNotFound()
                }else{
                    print("Item \(controller.selectedCategory.todoItems[inputInInt - 1].title) has been deleted")
                    controller.selectedCategory.todoItems.remove(at: (inputInInt - 1))
                }
            }
        }
    }else if(controller.menuOrder.getCurrentMenu() === AddItemToCategoryMenu.instance){
        if(input == "00"){
            controller.menuOrder.goBack()
        }else{
            if(!input.isNumber){
                controller.menuOrder.getCurrentMenu().commandNotFound()
            }else{
                inputInInt = Int(input)!
                if(inputInInt > controller.selectedCategoryNotIncludedItems.count ||
                    inputInInt < 1){
                    ItemsMenu.instance.itemNotFound()
                }else{
                    let item = controller.selectedCategoryNotIncludedItems[inputInInt - 1]
                    print("Item \(item.title) has been added to \(controller.selectedCategory.title)")
                    controller.selectedCategory.addItem(item: item)
                }
            }
        }
    }
    
    controller.menuOrder.getCurrentMenu().showMenu()
}

func skipInput() -> Bool {
    if(controller.menuOrder.getCurrentMenu() === AddItemMenu.instance || controller.menuOrder.getCurrentMenu() === AddCategoryMenu.instance){
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
