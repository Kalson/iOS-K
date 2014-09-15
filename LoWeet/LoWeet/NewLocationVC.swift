//
//  NewLocationVC.swift
//  LoWeet
//
//  Created by KaL on 9/15/14.
//  Copyright (c) 2014 KaL. All rights reserved.
//

import UIKit
import CoreLocation

class NewLocationVC: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    
    let locationManager = CLLocationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNewLocation() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
