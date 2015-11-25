//
//  InterfaceDoughPizza.swift
//  Order Pizza AW
//
//  Created by Nivardo Ibarra on 11/23/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import WatchKit
import Foundation

// Step: 1
protocol doughPizzaDelegate {
    func setPizzaDough(dough:String)
}

class InterfaceDoughPizza: WKInterfaceController {
    @IBOutlet var swtchThin: WKInterfaceSwitch!
    @IBOutlet var swtchCrisp: WKInterfaceSwitch!
    @IBOutlet var swtchThick: WKInterfaceSwitch!
    
    // Stept: 2
    var delegate: doughPizzaDelegate? = nil
    var pizzaCheeseTmp:  Pizza?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let myContext = context as! Pizza
        delegate = myContext.delegate as? doughPizzaDelegate
        pizzaCheeseTmp = myContext
        setDough()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setDough() {
        if let doughOld = pizzaCheeseTmp?.kindDough {
            switch doughOld {
            case "Thin":
                swtchThin.setOn(true)
            case "Crisp":
                swtchCrisp.setOn(true)
            case "Thick":
                swtchThick.setOn(true)
            default:
                swtchThin.setOn(false)
            }
        }
    }

    @IBAction func btnThin(value: Bool) {
        swtchCrisp.setOn(false)
        swtchThick.setOn(false)
        setPizzaDough("Thin")
    }
    
    @IBAction func btnCrisp(value: Bool) {
        swtchThin.setOn(false)
        swtchThick.setOn(false)
        setPizzaDough("Crisp")
    }
    
    @IBAction func btnThick(value: Bool) {
        swtchThin.setOn(false)
        swtchCrisp.setOn(false)
        setPizzaDough("Thick")
    }
//
    func setPizzaDough(dough: String) {
        //Stept: 3
        if delegate != nil {
            delegate!.setPizzaDough(dough)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }

}
