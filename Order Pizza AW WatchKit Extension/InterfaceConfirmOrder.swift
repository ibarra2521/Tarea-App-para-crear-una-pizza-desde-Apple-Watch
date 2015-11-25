//
//  InterfaceConfirmOrder.swift
//  Order Pizza AW
//
//  Created by Nivardo Ibarra on 11/23/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import WatchKit
import Foundation

// Step: 1
protocol orderPizzaDelegate {
    func newOrder()
}

class InterfaceConfirmOrder: WKInterfaceController {
    @IBOutlet var lblSize: WKInterfaceLabel!
    @IBOutlet var lblDough: WKInterfaceLabel!
    @IBOutlet var lblCheese: WKInterfaceLabel!
    @IBOutlet var lblngredients: WKInterfaceLabel!

    @IBOutlet var btnNewPizza: WKInterfaceButton!
    @IBOutlet var btnAcceptOutlet: WKInterfaceButton!
    
    // Stept: 2
    var delegate: orderPizzaDelegate? = nil
    var orderPizza: Pizza?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let myContext = context as! Pizza
        delegate = myContext.delegate as? orderPizzaDelegate
        orderPizza = myContext
        showOrder()
        
        //For testing
//        self.btnCancelOutlet.setHidden(true)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //
    func showOrder() {
        lblSize.setText(orderPizza?.size)
        lblDough.setText(orderPizza?.kindDough)
        lblCheese.setText(orderPizza?.kindCheese)
        var ingredients: String = ""
        for (_, value) in (orderPizza?.ingredients)! {
            ingredients += "\(value)\n"
        }
        let index1 = ingredients.substringToIndex(ingredients.endIndex.predecessor())
        lblngredients.setText(index1)
        print(ingredients)
    }
    
    @IBAction func btnAccept() {
        print("Send kitchen")
        self.btnNewPizza.setHidden(false)
        self.btnAcceptOutlet.setHidden(true)
        showAlertMessage("Your order has been sent to the kitchen")
    }
    
    
    @IBAction func btnCreateNewPizza() {
        //Stept: 3
        if delegate != nil {
            delegate!.newOrder()
            self.pushControllerWithName("main", context: "")
        }
    }
    
    func showAlertMessage(message: String){
        let action1 = WKAlertAction(title: "Accept", style: .Default, handler:{})
        let action3 = WKAlertAction(title: "X", style: .Cancel) {}
        self.presentAlertControllerWithTitle("", message: message, preferredStyle: .ActionSheet, actions: [action1, action3])
    }
    
    
}
