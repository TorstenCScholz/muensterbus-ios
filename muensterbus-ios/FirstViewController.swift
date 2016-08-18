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

        BusStopService.getBusStopJSON(textField.text!) {data, response in
                     
                // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let busstopGroupJSON = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as? NSDictionary else {
                    print("error trying to convert data to JSON GUARD")
                    return
                }
                let busstopGroup = BusStopGroup.createFromJSON(busstopGroupJSON)
                
                print("name:" + busstopGroup.name)
                
                // now we have the todo, let's just print it to prove we can access it
                for busstop in busstopGroup.bus_stops {
                    //let busstop = BusStop.createFromJSON(busstopJSON)
                    print("id:" + busstop.id)
                    print("name:" + busstop.name)
                    if busstop.direction != nil {
                        print("direction:" + busstop.direction!)
                    }
                    if busstop.station != nil {
                        print("station:" + busstop.station!)
                    }
                }
                
                
            } catch  {
                    print("error trying to convert data to JSON")
                    return
            }
            
        }
        
    }
    
}


