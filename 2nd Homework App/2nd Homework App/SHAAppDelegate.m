//
//  SHAAppDelegate.m
//  2nd Homework App
//
//  Created by KaL on 7/22/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SHAAppDelegate.h"
#import "SHAViewController.h"

@implementation SHAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    SHAViewController *SHA = [[SHAViewController alloc]init];
    self.window.rootViewController = SHA;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
