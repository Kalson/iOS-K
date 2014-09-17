//
//  LocationData.swift
//  LoWeet
//
//  Created by KaL on 9/15/14.
//  Copyright (c) 2014 KaL. All rights reserved.
//

/// add STTwitter framework to Xcode project (found on Github)
/// add touch to map to drop pin and show a "new tweet location" form like the plus button
/// make pins draggable and chance location for item when dropped
/// make a test Twitter account and sign in on your device
/// run some test tweets using STTwitter in your app


import UIKit
//import SwifteriOS

let _locationData: LocationData = {
    LocationData()
}()

class LocationData: NSObject {
    
    // singelton will handle all our tweets locations
    
    // variable were @properties in objC
    
    // let does the dispatch_once for the sigleton
    // singletons are optional b/c they may or be there
    
    var locations: [[String:AnyObject]] = [] // creates an empty array of dictionary
    
    // create class method
    class func mainData() -> LocationData {
        return _locationData
    }
    
    func addLocation(location:[String:AnyObject]){
        self.locations += [location] // add location to the array
        
        // fires the notification (the singleton fires the notification)
        let nC = NSNotificationCenter.defaultCenter()
        nC.postNotificationName("tweetLocationsUpdated", object: nil, userInfo: nil)

    }
    
}

// in swift have to use [String:AnyObject] so we know what's inside it
// locationData.mainData() is the same as _location

// notification is when one piece talking to another piece of code