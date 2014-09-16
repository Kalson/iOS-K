//
//  Marker.swift
//  LoWeet
//
//  Created by KaL on 9/15/14.
//  Copyright (c) 2014 KaL. All rights reserved.
//

import UIKit
import MapKit

class Marker: NSObject, MKAnnotation {
    
    var hiddenCoordinate: CLLocationCoordinate2D!
    
    var coordinate: CLLocationCoordinate2D {get {return self.hiddenCoordinate} } // adding get only makes it a read-only @property
    
    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        // setting up different method to set the coordinate
        self.hiddenCoordinate = newCoordinate
        
    }

   
}
