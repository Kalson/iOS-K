//
//  ViewController.swift
//  My Data
//
//  Created by KaL on 9/2/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

import UIKit
import CoreData

// Core data loads the cache of the phone (especically essential if u have no wifi)

// with core data you limit the query

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appD = UIApplication.sharedApplication().delegate as AppDelegate
        
        var fetchRequest = NSFetchRequest()
        
        // entity (is like a data table) holds all your data
        var entity = NSEntityDescription.entityForName("Post", inManagedObjectContext: appD.managedObjectContext)
        
        fetchRequest.entity = entity

        var predicate = NSPredicate(format: "user = 'jo@theironyard.com'")
        
        fetchRequest.predicate = predicate
        
        var sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // fetching some amount of data
        var fetchedObjects = appD.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil)
    
        println(fetchedObjects)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

