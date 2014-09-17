//
//  MapLocationsVC.swift
//  LoWeet
//
//  Created by KaL on 9/15/14.
//  Copyright (c) 2014 KaL. All rights reserved.
//

import UIKit
import MapKit

class MapLocationsVC: UIViewController {

    @IBOutlet weak var locationsMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // can only embeded navigation controller in a view controllers
        
        // still have to import the main core libaries (xcode does not to it, becuase it would be too slow)
        
        // start in any, any so you make all devices work easier
        
        let nC = NSNotificationCenter.defaultCenter()
        
        // defaultcenter is the singleton, so were accessing the same defaultcenter
        
        // and this VC listens for the notification being fired
        nC.addObserverForName("tweetLocationsUpdated", object: nil, queue: NSOperationQueue.mainQueue()) { (notification: NSNotification!) -> Void in
            
            self.markUpTheMap()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func markUpTheMap()
    {
        // want to call this everytime we have a new location
        
        // were gonna loop thru every locations
        for location in LocationData.mainData().tweetLocations{
            var marker = Marker()
            
//            Marker.coordinate = CLLocationCoordinate2D(latitude: location["latitude"], longitude: location["longitude"])
            
            var coordinate = CLLocationCoordinate2D(latitude: location["latitude"]! as CLLocationDegrees,
                longitude: location["longitude"]! as CLLocationDegrees)
            
            marker.setCoordinate(coordinate)
            
            self.locationsMapView.addAnnotation(marker)
            // the mapView than runs the getter method
            
            println(locationsMapView)
            
            
        }
        
     
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
