//
//  ViewController.swift
//  Rails App
//
//  Created by KaL on 9/2/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

import UIKit

let API = "http://ancient-taiga-9634.herokuapp.com/"

class ViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextField!
    
    @IBAction func postNew(sender: AnyObject) {
        
        // urlstring connecting to post
        let myPostURL = API + "posts"
        
        // ? -> a query string identifier
        let newPostURL = API + "posts?post[title]=\(titleField.text)&post[content]=\(contentField.text)"
        
        let encodedString = newPostURL.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        // we want to set a value for the header field
        var request = NSMutableURLRequest(URL: NSURL(string: encodedString!))
        
        request.setValue("zxcasdqwe", forHTTPHeaderField: "AUTH_TOKEN")
        request.HTTPMethod = "POST"
        
        // makes the connection request
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            
            
            // converts the json data to object C objects
            let info: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)!
            
            // ? make the object optional 
            // an optonal is a wrapper bool value (true or false(bool value), to check if it there or not. if there is a value (its true)
            // ! pulls it out of the optional
            
            println(info)
            
        }
    }
    
    @IBAction func getMyPosts(sender: AnyObject) {
        
        // urlstring connecting to post
        let myPostURL = API + "posts"
        
        // we want to set a value for the header field
        var request = NSMutableURLRequest(URL: NSURL(string: myPostURL))
        
        // we want to set a value for the header field -> thats why we using a mutable request (to change something on the request)
        // extra dedfinistion for a rewuest (additonal option to change a request to make more dynamic -> like a note on how u want ur mail deliveres)
        request.setValue("zxcasdqwe", forHTTPHeaderField: "AUTH_TOKEN")
        
        // makes the connection request
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            // converts the json data to object C objects
            let posts = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
            
            println(posts)
        
        }
    }
    
    @IBAction func getAllPosts(sender: AnyObject) {
        
        let allPostsURL = API + "posts"
        
        // make the request (the actual line making the request)
        let request = NSURLRequest(URL: NSURL(string: allPostsURL))
        
        // makes the connection request
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            // converts the json data to object C objects
            let posts = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
            
            println(posts)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

