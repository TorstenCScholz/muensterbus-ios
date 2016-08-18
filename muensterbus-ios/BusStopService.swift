//
//  BusStopService.swift
//  muensterbus-ios
//
//  Created by Bus Driver on 18/08/16.
//  Copyright © 2016 Metabus. All rights reserved.
//

import Foundation

class BusStopService {
    
    class func getBusStopJSON(searchTerm: String, callbackFunc: ((data: NSData?, response: NSHTTPURLResponse) -> Void)) {
        
        let SEARCH_API_URL = "http://46.101.172.145:4567/search/"
        
        let request = NSMutableURLRequest(URL: NSURL(string: SEARCH_API_URL + searchTerm)!)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
                // check for any erorrs
                guard error == nil else {
                    print("error calling GET on /todos/1")
                    print(error)
                    return
                }
            
            let httpResponse = response as! NSHTTPURLResponse
            callbackFunc(data: data, response: httpResponse)
            
        }
        
        task.resume()
        
    }
}