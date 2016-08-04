//
//  Departure.swift
//  muensterbus-ios
//
//  Created by RolandKaiser on 29.07.16.
//  Copyright © 2016 Metabus. All rights reserved.
//

import Foundation

class Departure {
    
    var bus_line: String
    var departure_at: String
    var departure_in: String

    
    init(bus_line: String, departure_at: String, departure_in: String) {
        self.bus_line = bus_line
        self.departure_at = departure_at
        self.departure_in = departure_in
    }
    
    class func createFromJSON(departureJSON: NSDictionary) -> Departure {
        let bus_line = departureJSON["bus-line"] as? NSString
        let departure_at = departureJSON["departure-at"] as? NSString
        let departure_in = departureJSON["departure-in"] as? NSString
        
        let departure = Departure(bus_line: bus_line! as String, departure_at: departure_at! as String, departure_in: departure_in! as String)
        
        return departure
    }
    
}