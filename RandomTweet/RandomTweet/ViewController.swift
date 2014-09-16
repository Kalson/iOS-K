//
//  ViewController.swift
//  RandomTweet
//
//  Created by KaL on 9/16/14.
//  Copyright (c) 2014 KaL. All rights reserved.
//

import UIKit
import Accounts
import Social
import SwifteriOS // running the import tries to build that target

class ViewController: UIViewController {
    
    var swifter = Swifter(consumerKey: "", consumerSecret: "")


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // trying to connect to the twiter accounts of the iPhone
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted: Bool, error: NSError!) -> Void in
        
            if granted {
                let twitterAccounts = accountStore.accountsWithAccountType(accountType)
                let twitterAccount = twitterAccounts[2] as ACAccount
                
                self.swifter = Swifter(account: twitterAccount)
                
                self.swifter.postStatusUpdate("Im posting from an app that I built w/ the new swifter framework #iOS #swift", inReplyToStatusID: nil, lat: nil, long: nil, placeID: nil, displayCoordinates: false, trimUser: false, success: { (status) -> Void in
                    
                }, failure: { (error) -> Void in
                    
                })
                
                
                
//                self.swifter.getStatusesHomeTimelineWithCount(5, sinceID: nil, maxID: nil, trimUser: true, contributorDetails: true, includeEntities: true, success: { (statuses) -> Void in
//                    
//                    println(statuses)
//                    
//                }, failure: { (error) -> Void in
//                    
//                    println(error)
//                    
//                })
        
                println(twitterAccounts)
                
                for tAccount in twitterAccounts {
                    let tA = tAccount as ACAccount
                    
//                    println(tA.userFullName)
                    println(tA.username) // kalsonkalu
                    println(tA.accountDescription) // @kalsonkalu
//                    println(tA.credential)
                    println(tA.identifier) // token

                    
                    
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

