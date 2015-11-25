//
//  InterfaceController.swift
//  Order Pizza AW WatchKit Extension
//
//  Created by Nivardo Ibarra on 11/23/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController, sizePizzaDelegate, doughPizzaDelegate, cheesePizzaDelegate, ingredientsPizzaDelegate, orderPizzaDelegate {
    var customPizza: Pizza = Pizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func btnSize() {
        customPizza.delegate = self
        pushControllerWithName("IdentifierSize", context: customPizza)
    }
    
    @IBAction func btnDough() {
        customPizza.delegate = self
        pushControllerWithName("IdentifierDough", context: customPizza)
    }
    
    @IBAction func btnCheese() {
        customPizza.delegate = self
        pushControllerWithName("IdentifierCheese", context: customPizza)
    }
    
    @IBAction func btnIngredients() {
        customPizza.delegate = self
        pushControllerWithName("IdentifierIngredients", context: customPizza)
    }
    
    @IBAction func btnConfirmOrder() {
        if validateSelectionSteps(){
            customPizza.delegate = self
            pushControllerWithName("IdentifierOrder", context: customPizza)        
        }else {
            showAlertMessage("You need to select missing items");
        }
    }
    
    // Step: 4
    func setPizzaSize(size: String) {
        customPizza.size = size
    }
    
    // Step: 4
    func setPizzaDough(dough: String) {
        customPizza.kindDough = dough
    }
    
    // Step: 4
    func setPizzaIngredients(ingredients: [String: String]) {
        customPizza.ingredients = ingredients
    }

    // Step: 4
    func setPizzaCheese(cheese: String){
        customPizza.kindCheese = cheese
    }
    
    // Step: 4
    func newOrder() {
        customPizza.size = nil
        customPizza.kindDough = nil
        customPizza.kindCheese = nil
        customPizza.ingredients = [String: String]()
    }
    
    func validateSelectionSteps() -> Bool{
        if (customPizza.size != nil && customPizza.kindDough != nil && customPizza.kindCheese != nil && customPizza.ingredients.count != 0) {
            return true
        }
        return false
    }

    func showAlertMessage(message: String){
        let action1 = WKAlertAction(title: "Accept", style: .Default, handler:{})
        let action3 = WKAlertAction(title: "X", style: .Cancel) {}
        self.presentAlertControllerWithTitle("", message: message, preferredStyle: .ActionSheet, actions: [action1, action3])
    }

}
