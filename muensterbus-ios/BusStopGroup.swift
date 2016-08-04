//
//  BusStopGroup.swift
//  muensterbus-ios
//
//  Created by RolandKaiser on 29.07.16.
//  Copyright © 2016 Metabus. All rights reserved.
//

import Foundation

class BusStopGroup {
    
    var name: String
    var bus_stops: [BusStop]
    
    init(name:String, bus_stops:[BusStop]) {
        self.name = name
        self.bus_stops = bus_stops
    }
    
    class func createFromJSON(busstopgroupJSON: NSDictionary) -> BusStopGroup {
        
        let name = busstopgroupJSON["name"] as? NSString
        var busstopArray = [BusStop]()
        
        for busstopJSON in busstopgroupJSON["bus_stops"] as! [NSDictionary] {
            
            let busstop = BusStop.createFromJSON(busstopJSON)
            busstopArray.append(busstop)
        }
       
        let busstopGroup = BusStopGroup(name: name as! String, bus_stops: busstopArray)
        
        return busstopGroup
    }

}