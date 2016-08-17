//
//  FirstViewController.swift
//  muensterbus-ios
//
//  Created by RolandKaiser on 14.07.16.
//  Copyright © 2016 Metabus. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    // RK: Properties
    @IBOutlet weak var busstopTextField: UITextField!
    @IBOutlet weak var busstopNameLabel: UILabel!
    var requestedBusstop: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        busstopTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // RK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        busstopNameLabel.text = textField.text
        requestedBusstop = textField.text
    
        //RK:   Hier würde ich gerne die Funktion doBusStop() aus AppDelegate aufrufen und die Variable
        //      requestedBusstop mitgeben.
        
        
    }
    

}

