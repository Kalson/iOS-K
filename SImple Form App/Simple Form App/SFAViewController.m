//
//  SFAViewController.m
//  Simple Form App
//
//  Created by KaL on 7/21/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SFAViewController.h"

@interface SFAViewController ()

@end

@implementation SFAViewController

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

- (IBAction)loginButtonClicked:(id)sender
{
    // get username
    NSString *username = self.usernameTextField.text;
    // get password text
    NSString *password = self.passwordTextField.text;
    
    // warn user
    UIAlertView *noUsernameAlert = [[UIAlertView alloc]initWithTitle:@"Failed Login" message:@"Please put a username in next time you try to login." delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
    [noUsernameAlert show];
    
    
    NSLog(@"username is %@ and password is %@",username, password);
    // check if fields are empty,
    if ([self.usernameTextField.text isEqualToString:@""]){
        NSLog(@"username is empty... tell user to fill in");
    } else {
        
    }
    // try login submission success
    // TIY:NOTE
    
    
}
@end
