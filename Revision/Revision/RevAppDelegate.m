//
//  RevAppDelegate.m
//  Revision
//
//  Created by KaL on 8/7/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "RevAppDelegate.h"

#import "RevCalculator.h"

@implementation RevAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self playWithCalcultor]
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[UIViewController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)playWithCalculator
{
    RevCalculator * calc = [[RevCalculator alloc]init];
    [calc dosSomething1];
}

@end
