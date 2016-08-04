//
//  BusStop.swift
//  muensterbus-ios
//
//  Created by RolandKaiser on 26.07.16.
//  Copyright © 2016 Metabus. All rights reserved.
//

import Foundation

class BusStop {
    
    var id: String
    var name: String
    var direction: String?
    var station: String?
    
    init(id:String, name:String, direction:String?, station:String?) {
        self.id = id
        self.name = name
        self.direction = direction
        self.station = station
    }

    func hasStation()->Bool {
        if (self.station == "") {return true} else {return false}
    }
    
    class func createFromJSON(busstopJSON: NSDictionary) -> BusStop {
        
        let id = busstopJSON["id"] as? NSString
        let name = busstopJSON["name"] as? NSString
        var direction: NSString = ""
        var station: NSString = ""
        
        if busstopJSON["direction"] != nil && !(busstopJSON["direction"] is NSNull) {
            direction = busstopJSON["direction"] as! NSString
        }
        if busstopJSON["station"] != nil && !(busstopJSON["station"] is NSNull) {
            station = busstopJSON["station"] as! NSString
        }
        
        
        let busstop = BusStop(id: id! as String, name: name! as String, direction: direction as String, station: station as String)
        
        return busstop
    }
}


