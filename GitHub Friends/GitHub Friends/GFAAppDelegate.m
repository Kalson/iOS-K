//
//  GFAAppDelegate.m
//  GitHub Friends
//
//  Created by KaL on 7/24/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "GFAAppDelegate.h"
#import "GFATableViewController.h"
#import "GFATableViewCell.h"

@implementation GFAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UINavigationController *nC = [[UINavigationController alloc]initWithRootViewController:[[GFATableViewController alloc]initWithStyle:UITableViewStylePlain]];
    
    
    UINavigationBar *navigationBar = nC.navigationBar;
//    navigationBar.barTintColor = [UIColor colorWithRed:1.000f green:0.000f blue:0.267f alpha:1.0f];
    
    navigationBar.tintColor = [UIColor whiteColor];
    
//    GFATableViewController * tVControl = [[GFATableViewController alloc] init];
//    
//    
//    tVControl.searchBar = [[UITextField alloc]initWithFrame:CGRectMake(10, 40, 250, 40)];
//    tVControl.searchBar.layer.borderWidth = 1;
//    tVControl.searchBar.placeholder = @"Search";
//    [tVControl.self.view addSubview:tVControl.searchBar];
//    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 20)];
//    tVControl.searchBar.leftView = paddingView;
//    tVControl.searchBar.leftViewMode = UITextFieldViewModeAlways;
//   // tVControl.searchBar.delegate = tVControl;
//    
    


    self.window.rootViewController = nC;
  
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
