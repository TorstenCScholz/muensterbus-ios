//
//  BusStop.swift
//  muensterbus-ios
//
//  Created by RolandKaiser on 26.07.16.
//  Copyright © 2016 Metabus. All rights reserved.
//

import Foundation

class BusStop {
    
    var id: Int
    var name: String
    var direction: String?
    var station: String?
    
    init(id:Int, name:String, direction:String?, station:String?) {
        self.id = id
        self.name = name
        self.direction = direction
        self.station = station
    }

    func hasStation()->Bool {
        if (self.station == "") {return true} else {return false}
    }
}


