//
//  PREViewController.m
//  PreApp
//
//  Created by KaL on 7/21/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "PREViewController.h"

@interface PREViewController ()

@end

@implementation PREViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender
{
    NSLog(@"button was clicked");
    self.testLabel.text =@"button was clicked";
}
@end
