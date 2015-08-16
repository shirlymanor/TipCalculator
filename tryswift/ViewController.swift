//
//  ViewController.swift
//  tryswift
//
//  Created by Shirly Manor on 8/7/15.
//  Copyright © 2015 Shirly Manor. All rights reserved.
//

import UIKit

class ViewController:UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var middleOfNumber:Bool = false;
    @IBAction func appendDigit(sender: UIButton, forEvent event: UIEvent)
    {
        let digit = sender.currentTitle!;
        
        if (middleOfNumber)
        {
            display.text = display.text! + digit;
        }
        else
        {
            display.text = digit;
            middleOfNumber = true;
        }

    }
    var operateArr = Array<Double>();
    
    @IBAction func enter()
    {
        middleOfNumber = false;
        operateArr.append(displayValue);
    }
    
    @IBAction func calcTip(sender: UIButton)
    {
        enter()
        if (operateArr.count >= 1)
        {
            let title = sender.currentTitle
            let num = title!.substringToIndex(advance(title!.endIndex,-1))
            let tip = NSNumberFormatter().numberFromString(num)!.doubleValue
            preformOneOperetor(){$0 *  tip/100}
        }
    }
    @IBAction func operate(sender: UIButton) {
        
        let operateValue = sender.currentTitle!;
        if middleOfNumber{
            enter();
        }
//        if (operateArr.count >= 1)
//        {
            switch operateValue{
                
            case "×":
                preformOperetor(){$0 * $1};
            case "+":
                preformOperetor(){$0 + $1}
            case "−":
                preformOperetor(){$0 - $1}
            case "÷":
                preformOperetor(){$0 / $1}
            default:break;
                
         //   }
        }
    }
    func preformOperetor(operateValue: (Double, Double ) ->Double)
        {
            print(operateArr.count);
            if (operateArr.count >= 2){
                displayValue = operateValue(operateArr.removeLast(),operateArr.removeLast());
            enter();
            }
    }
    
    private func preformOneOperetor( operateValue: Double ->Double)
    {
        enter();
        print(operateArr.count)
        if (operateArr.count >= 1){
            displayValue = operateValue(operateArr.removeLast());
            
        }
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = ("\(newValue)");
            middleOfNumber = false;
        }
    }
   }

