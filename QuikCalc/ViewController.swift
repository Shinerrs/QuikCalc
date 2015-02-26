//
//  ViewController.swift
//  QuikCalc
//  Altered by; Mark Shine 20052862
//  Created by Robert O'Connor on 12/02/2015.
//  Copyright (c) 2015 WIT. All rights reserved.
//

import UIKit

/*
1. User presses digit - number appended to string (up to 10 digits)
2. User presses operator:
- number converted to int
- operator logged
- gets ready for next number
3. User presses =
- currentTotal displayed (including any calculated value)
4. User presses C
- All clear
5. User presses D:
- last digit of displayLabel deleted
- if 0 or 1 digits, back to 0
*/


class ViewController: UIViewController {
    
    // does this require a limiter? So as to only display a certain number of characters?
    @IBOutlet weak var displayLabel: UILabel!
    // or should it be done in InterfaceBuilder?
    var oldTotal:Int = 0;
    var currentTotal:Int = 0;
    var oper:String?
    var equAct:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = "\(currentTotal)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    If 0 display, start a new one, otherwise append
    
    If operator set, start new number
    
    Is this it?
    */
    @IBAction func pressNumber(sender: AnyObject) {
       
        if let digit = (sender as UIButton).titleLabel?.text {
            if(displayLabel.text! != "0"){
                displayLabel.text! += digit
            }
            else{
                displayLabel.text = digit
            }
        }
    }
    
    /*
    If no currentValue, copy in displayLabel. Set operator
    If currentValue, set operator and recalculate
    Is this it?
    */
    @IBAction func pressOperator(sender: AnyObject) {
        let o:String! = (sender as UIButton).titleLabel?.text
        
        currentTotal = (displayLabel.text!).toInt()!
        oldTotal = oldTotal + currentTotal
        
        if currentTotal != 0 {
        switch(o){
        case "+":
            // add operation
            oldTotal = currentTotal
            oper = "+"
            currentTotal = 0
        case "-":
            // subtract operation
            oldTotal = currentTotal
            oper = "-"
            currentTotal = 0
        case "x":
            // multiply operation
            oldTotal = currentTotal
            oper = "x"
            currentTotal = 0
        case "/":
            // divide operation
            oldTotal = currentTotal
            oper = "/"
            currentTotal = 0
        default:
            oper = nil
        }
        }
        displayLabel.text = "\(currentTotal)"
   
    }
    
    /*
    Perform calculation and display result
    */
    @IBAction func equalsOp (sender: AnyObject) {
        currentTotal = (displayLabel.text!).toInt()!
        equAct = true
        if(oper == "+"){
            
            currentTotal = oldTotal + currentTotal
            
        }
        
        
        
        if(oper == "-"){
            
            currentTotal = oldTotal - currentTotal
            
        }
        
        
        
        if(oper == "x"){
            
            currentTotal = oldTotal * currentTotal
            
        }
        
        
        
        if(oper == "/"){
            println(currentTotal)
            currentTotal = oldTotal / currentTotal
            println("/")
            println(currentTotal)
        }
        println(oldTotal)
        println(oper)
        println(currentTotal)
        
        displayLabel.text = "\(currentTotal)"
        currentTotal = 0
        oldTotal = 0
    }
    
    /*
    Reset all values
    */
    @IBAction func clearOp (sender: AnyObject) {
        currentTotal = 0
        oldTotal = 0
        oper = nil
        
        displayLabel.text = "\(currentTotal)"
    }
    
    /*
    if displayLabel has more than one digit, append
    else reset to 0
    */
    @IBAction func deleteOp (sender: AnyObject) {
        var display:String! = displayLabel.text
        
        if(countElements(display) > 1){
            display = dropLast(display)
        }
        else{
            display = "0"
        }
        
        displayLabel.text = "\(display)"
    }
    
}