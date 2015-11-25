//
//  InterfaceSizePizza.swift
//  Order Pizza AW
//
//  Created by Nivardo Ibarra on 11/24/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import WatchKit
import Foundation

// Step: 1
protocol sizePizzaDelegate {
    func setPizzaSize(size:String)
}

class InterfaceSizePizza: WKInterfaceController {
    @IBOutlet var swtchSmall: WKInterfaceSwitch!
    @IBOutlet var swtchMedian: WKInterfaceSwitch!
    @IBOutlet var swtchBig: WKInterfaceSwitch!
    
    // Stept: 2
    var pizzaCheeseTmp:  Pizza?
    var delegate: sizePizzaDelegate? = nil
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let myContext = context as! Pizza
        delegate = myContext.delegate as? sizePizzaDelegate
        pizzaCheeseTmp = myContext
        setSize()
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
    func setSize() {
        if let sizeOld = pizzaCheeseTmp?.size {
            switch sizeOld {
            case "Small":
                swtchSmall.setOn(true)
            case "Median":
                swtchMedian.setOn(true)
            case "Big":
                swtchBig.setOn(true)
            default:
                swtchSmall.setOn(false)
            }
        }
    }

    
    @IBAction func btnSmall(value: Bool) {
        swtchMedian.setOn(false)
        swtchBig.setOn(false)
        setPizzaSize("Small")

    }
    
    @IBAction func btnMedian(value: Bool) {
        swtchSmall.setOn(false)
        swtchBig.setOn(false)
        setPizzaSize("Median")

    }

    @IBAction func btnBig(value: Bool) {
        swtchSmall.setOn(false)
        swtchMedian.setOn(false)
        setPizzaSize("Big")

    }
    
    func setPizzaSize(size: String) {
        //Stept: 3
        if delegate != nil {
            delegate!.setPizzaSize(size)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    
}
