//
//  ParseStarterProjectViewController.m
//  ParseStarterProject
//
//  Copyright 2014 Parse, Inc. All rights reserved.
//

#import "ParseStarterProjectViewController.h"

#import <Parse/Parse.h>

@implementation ParseStarterProjectViewController

#pragma mark - UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UINavigationController *navC = (UINavigationController *)[self.navigationController presentingViewController];
//    // presentingViewController thinks its a view controller
//    navC.viewControllers
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)sendMessage:(id)sender {
    PFQuery *userQuery = [PFUser query];
    // everybody else
    [userQuery whereKey:@"username" notEqualTo:[PFUser currentUser][@"username"]];
    
    // now to push to another device
    PFQuery *deviceQuery = [PFInstallation query];
    // to find in a specific device a specific user
    [deviceQuery whereKey:@"user" matchesQuery:userQuery];
    
    // running a push based on the device
    PFPush *pushMessage = [PFPush push];
    [pushMessage setQuery:deviceQuery];
    [pushMessage setMessage:self.messageField.text];
    [pushMessage sendPushInBackground]; // send push async
    
}
@end
