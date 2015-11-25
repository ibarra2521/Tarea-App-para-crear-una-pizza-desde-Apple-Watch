//
//  InterfaceCheesePizza.swift
//  Order Pizza AW
//
//  Created by Nivardo Ibarra on 11/23/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import WatchKit
import Foundation

// Step: 1
protocol cheesePizzaDelegate {
    func setPizzaCheese(cheese:String)
}

class InterfaceCheesePizza: WKInterfaceController {
    @IBOutlet var swtchMozzarella: WKInterfaceSwitch!
    @IBOutlet var swtchCheddar: WKInterfaceSwitch!
    @IBOutlet var swtchParmesan: WKInterfaceSwitch!
    @IBOutlet var swtchNoCheese: WKInterfaceSwitch!
    
    // Stept: 2
    var delegate: cheesePizzaDelegate? = nil
    var pizzaCheeseTmp:  Pizza?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let myContext = context as! Pizza
        delegate = myContext.delegate as? cheesePizzaDelegate
        pizzaCheeseTmp = myContext
        setCheese()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setCheese() {
        if let cheeseOld = pizzaCheeseTmp?.kindCheese {
            switch cheeseOld {
            case "Mozzarella":
                swtchMozzarella.setOn(true)
            case "Cheddar":
                swtchCheddar.setOn(true)
            case "Parmesan":
                swtchParmesan.setOn(true)
            case "No Cheese":
                swtchNoCheese.setOn(true)
            default:
                swtchNoCheese.setOn(false)
            }
        }
    }
    
    @IBAction func swtchMozzarella(value: Bool) {
        swtchCheddar.setOn(false)
        swtchParmesan.setOn(false)
        swtchNoCheese.setOn(false)
        setPizzaCheese("Mozzarella");

    }
    
    @IBAction func swtchCheddar(value: Bool) {
        swtchMozzarella.setOn(false)
        swtchParmesan.setOn(false)
        swtchNoCheese.setOn(false)
        setPizzaCheese("Cheddar");
    }
    
    @IBAction func swtchParmesan(value: Bool) {
        swtchMozzarella.setOn(false)
        swtchCheddar.setOn(false)
        swtchNoCheese.setOn(false)
        setPizzaCheese("Parmesan");
    }
    
    @IBAction func swtchNoCheese(value: Bool) {
        swtchMozzarella.setOn(false)
        swtchCheddar.setOn(false)
        swtchParmesan.setOn(false)
        setPizzaCheese("No Cheese");
    }
    
    func setPizzaCheese(cheese: String) {
        //Stept: 3
        if delegate != nil {
            delegate!.setPizzaCheese(cheese)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }


}
