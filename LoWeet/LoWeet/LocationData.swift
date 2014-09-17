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
import CoreLocation

let _locationData: LocationData = {
    LocationData()
}()

class LocationData: NSObject, CLLocationManagerDelegate {
    
    // singelton will handle all our tweets locations
    
    // variable were @properties in objC
    
    // let does the dispatch_once for the sigleton
    // singletons are optional b/c they may or be there
    
    var tweetLocations: [[String:AnyObject]] = [] // creates an empty array of dictionary
    var f
    
    // create class method
    class func mainData() -> LocationData {
        
    
        
        return _locationData
    }
    
    func addLocation(location:[String:AnyObject]){
        self.tweetLocations += [location] // add location to the array
        
        // fires the notification (the singleton fires the notification)
        let nC = NSNotificationCenter.defaultCenter()
        nC.postNotificationName("tweetLocationsUpdated", object: nil, userInfo: nil)

    }
    
    /// location
    
    let locationManager = CLLocationManager()
    
    override init() { // init is sepecial case that does not need overide func init
        super.init()
        
        self.locationManager.delegate = self
        
        self.locationManager.distanceFilter = 40.0
        
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        for location in locations as [CLLocation] { // we want to loop thru our saved locations
            
            for tweetLocation in self.tweetLocations { // loop thru current location
                
                var tweetLocationPoint = CLLocation(latitude: tweetLocation["latitude"]! as CLLocationDegrees, longitude: tweetLocation["longitude"]! as CLLocationDegrees)
                
               var distance1 = location.distanceFromLocation(tweetLocationPoint)
                
                var distance2 = self.checkDistanceBetweenLocations(location, location2: tweetLocationPoint)
                
                // anytime u get a value out of dictionary its an optional
                
                println(distance1)
                println(distance2)
                
                if distance2 < 50.0 {
                    // post tweet
                    
                    // what was the last time I tweeted the same post
                }
                
            }
            
        }
    }
    
    func checkDistanceBetweenLocations(location1: CLLocation, location2: CLLocation) -> Double {
        
       let DEG_TO_RAD = 0.017453292519943295769236907684886
        let EARTH_RADIUS_IN_METERS = 6372797.560856
        
       let latitudeArc  = (location1.coordinate.latitude - location2.coordinate.latitude) * DEG_TO_RAD
        let longitudeArc = (location1.coordinate.longitude - location2.coordinate.longitude) * DEG_TO_RAD
        
        var latitudeH = sin(latitudeArc * 0.5)
        latitudeH *= latitudeH;
        
        var longitudeH = sin(longitudeArc * 0.5)
        longitudeH *= longitudeH;
        
        let tmp = cos(location1.coordinate.latitude * DEG_TO_RAD) * cos(location2.coordinate.latitude * DEG_TO_RAD)
        
        return EARTH_RADIUS_IN_METERS * 2.0 * asin(sqrt(latitudeH + tmp * longitudeH))
        
        // int() to turn a value into a int
    }
    
}

// in swift have to use [String:AnyObject] so we know what's inside it
// locationData.mainData() is the same as _location

// notification is when one piece talking to another piece of code




