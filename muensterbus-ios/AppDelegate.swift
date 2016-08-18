//
//  AppDelegate.swift
//  muensterbus-ios
//
//  Created by RolandKaiser on 14.07.16.
//  Copyright © 2016 Metabus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //var fvc = FirstViewController()
    //var dbsRequestedBusStop : String = " "

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //doBusStop()
        //doDeparture()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
  
    func doDeparture() {
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://46.101.172.145:3000/departures/4100001")!)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            // check for any erorrs
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error)
                return
            }
            
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            print(responseData)
            // parse the result as JSON, since that's what the API provides
            do {
                guard let departures = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as? [NSDictionary] else {
                    print("error trying to convert data to JSON")
                    return
                }
                
                // now we have the todo, let's just print it to prove we can access it
                
                for departureJSON in departures {
                    let departure = Departure.createFromJSON(departureJSON)
                    print("busline:" + departure.bus_line)
                    print("departure_at:" + departure.departure_at)
                    print("departure_in:" + departure.departure_in)
                }
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
        }
        task.resume()
    }
    


}

