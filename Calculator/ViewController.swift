//
//  ViewController.swift
//  Calculator
//
//  Created by JACKLIEN on 4/20/18.
//  Copyright © 2018 JACKLIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var performingMath = false; //reset
    var operation = 0;
    var check = false;
    var closeW = 0
    var openW = 0
    var inN = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if (performingMath == true)
        {
            label.text = ""
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            check = false
            openW = 1
            closeW = 1
            inN = 0
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 14 && sender.tag != 19 && inN != 1 {
            if (sender.tag == 15 && closeW == 1)
            {
                label.text = label.text! + "/"
                openW = 0
            }
            else if (sender.tag == 16 && closeW == 1)
            {
                label.text = label.text! + "*"
                openW = 0
            }
            else if (sender.tag == 17)
            {
                label.text = label.text! + "-"
                openW = 0
            }
            else if (sender.tag == 18 && closeW == 1)
            {
                label.text = label.text! + "+"
                openW = 0
            }
            else if (sender.tag == 11)
            {
                label.text = label.text! + "."
            }
            check = true
            performingMath = false
            inN = 1
        }
        if (sender.tag == 12 && openW == 0)
        {
            label.text = label.text! + "("
            operation = operation + 1
            openW = 1
        }
        if (sender.tag == 13 && openW == 1)
        {
            label.text = label.text! + ")"
            operation = operation - 1
            inN = 0
            closeW = 1
        }
        if(sender.tag == 14) //C
        {
            label.text = ""
            check = false;
            performingMath = false;
            operation = 0
        }
        if(sender.tag == 20) // DEL
        {
            var chuoi: String = label.text!
            chuoi = String(chuoi.dropLast())
            label.text = String(chuoi)
        }
        if(sender.tag == 21)
        {
            label.text = label.text! + "sin("
            operation = operation + 1
            openW = 1

        }
        
        if(sender.tag == 19 && operation == 0 && performingMath == false) // =
        {
            let currentText = label.text
            let expression = NSExpression(format: currentText!)
            let mathValue = expression.expressionValue(with: nil, context: nil) as! NSNumber
            //label.text = String(format: "%.2f", mathValue)
            label.text = String(describing: mathValue)
            performingMath = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

