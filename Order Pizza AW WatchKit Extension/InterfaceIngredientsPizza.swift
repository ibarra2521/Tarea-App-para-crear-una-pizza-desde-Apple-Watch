//
//  InterfaceIngredientsPizza.swift
//  Order Pizza AW
//
//  Created by Nivardo Ibarra on 11/23/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import WatchKit
import Foundation

// 1
protocol ingredientsPizzaDelegate {
    func setPizzaIngredients(ingredients:[String:String])
}


class InterfaceIngredientsPizza: WKInterfaceController {
    @IBOutlet var swtchHam: WKInterfaceSwitch!
    @IBOutlet var swtchPepperoni: WKInterfaceSwitch!
    @IBOutlet var swtchTurkey: WKInterfaceSwitch!
    @IBOutlet var swtchSausage: WKInterfaceSwitch!
    @IBOutlet var swtchOlive: WKInterfaceSwitch!
    @IBOutlet var swtchOnion: WKInterfaceSwitch!
    @IBOutlet var swtchPepper: WKInterfaceSwitch!
    @IBOutlet var swtchPineapple: WKInterfaceSwitch!
    @IBOutlet var swtchAnchovy: WKInterfaceSwitch!
    
    // Stept: 2
    var delegate: ingredientsPizzaDelegate? = nil
    var ingredients = [String: String]()
    var pizzaIngredientsTmp:  Pizza?
    
    var swtchHamStatus: Bool = false
    var swtchPepperoniStatus: Bool = false
    var swtchTurkeyStatus: Bool = false
    var swtchSausageStatus: Bool = false
    var swtchOliveStatus: Bool = false
    var swtchOnionStatus: Bool = false
    var swtchPepperStatus: Bool = false
    var swtchPineappleStatus: Bool = false
    var swtchAnchovyStatus: Bool = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let myContext = context as! Pizza
        delegate = myContext.delegate as? ingredientsPizzaDelegate
        pizzaIngredientsTmp = myContext
        ingredients = (pizzaIngredientsTmp?.ingredients)!
        setIngredientsOn()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setIngredientsOn() {
        for (_, value) in (ingredients) {
            switch value {
            case "Ham":
                swtchHam.setOn(true)
                swtchHamStatus = true
            case "Pepperoni":
                swtchPepperoni.setOn(true)
                swtchPepperoniStatus = true
            case "Turkey":
                swtchTurkey.setOn(true)
                swtchTurkeyStatus = true
            case "Sausage":
                swtchSausage.setOn(true)
                swtchSausageStatus = true
            case "Olive":
                swtchOlive.setOn(true)
                swtchOliveStatus = true
            case "Onion":
                swtchOnion.setOn(true)
                swtchOnionStatus = true
            case "Pepper":
                swtchPepper.setOn(true)
                swtchPepperStatus = true
            case "Pineapple":
                swtchPineapple.setOn(true)
                swtchPineappleStatus = true
            case "Anchovy":
                swtchAnchovy.setOn(true)
                swtchAnchovyStatus = true
            default:
                swtchHam.setOn(false)
            }
        }
    }
        
        func existIngredient(key: String) -> Bool {
            if  (ingredients[key] == nil) {
                return true
            }else {
                return false
            }
        }
        
        func availableSpace() -> Bool {
            if ingredients.count < 5 {
                return true
            }else {
                return false
            }
        }

    @IBAction func btnHam(value: Bool) {
        if swtchHamStatus == true {
            ingredients["Ham"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Ham"] = "Ham"
            }else {
                swtchHam.setOn(false)
                swtchHamStatus = false
                ingredients["Ham"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func btnPepperoni(value: Bool) {
        if swtchPepperoniStatus == true {
            ingredients["Pepperoni"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pepperoni"] = "Pepperoni"
            }else {
                swtchPepperoni.setOn(false)
                swtchPepperoniStatus = false
                ingredients["Pepperoni"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func btnTurkey(value: Bool) {
        if swtchTurkeyStatus == true {
            ingredients["Turkey"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Turkey"] = "Turkey"
            }else {
                swtchTurkey.setOn(false)
                swtchTurkeyStatus = false
                ingredients["Turkey"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func btnSausage(value: Bool) {
        if swtchSausageStatus == true {
            ingredients["Sausage"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Sausage"] = "Sausage"
            }else {
                swtchSausage.setOn(false)
                swtchSausageStatus = false
                ingredients["Sausage"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func btnOlive(value: Bool) {
        if swtchOliveStatus == true {
            ingredients["Olive"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Olive"] = "Olive"
            }else {
                swtchOlive.setOn(false)
                swtchOliveStatus = false
                ingredients["Olive"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func btnOnion(value: Bool) {
        if swtchOnionStatus == true {
            ingredients["Onion"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Onion"] = "Onion"
            }else {
                swtchOnion.setOn(false)
                swtchOnionStatus = false
                ingredients["Onion"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func btnPepper(value: Bool) {
        if swtchPepperStatus == true {
            ingredients["Pepper"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pepper"] = "Pepper"
            }else {
                swtchPepper.setOn(false)
                swtchPepperStatus = false
                ingredients["Pepper"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    @IBAction func btnPineapple(value: Bool) {
        if swtchPineappleStatus == true {
            ingredients["Pineapple"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pineapple"] = "Pineapple"
            }else {
                swtchPineapple.setOn(false)
                swtchPineappleStatus = false
                ingredients["Pineapple"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    @IBAction func btnAnchovy(value: Bool) {
        if swtchAnchovyStatus == true {
            ingredients["Anchovy"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Anchovy"] = "Anchovy"
            }else {
                swtchAnchovy.setOn(false)
                swtchAnchovyStatus = false
                ingredients["Anchovy"] = nil
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    func setPizzaIngredients(ingredients: [String: String]) {
        //Stept: 3
        if delegate != nil {
            delegate!.setPizzaIngredients(ingredients)
        }
    }

}
