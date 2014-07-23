    //
//  FHAViewController.m
//  First Homework App
//
//  Created by KaL on 7/21/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "FHAViewController.h"

@interface FHAViewController ()

@end

@implementation FHAViewController

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

- (IBAction)loginButtonWasPressed:(id)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"username is %@ and password is %@", username, password);


  if ([self.usernameTextField.text isEqualToString:@""] && [self.passwordTextField.text isEqualToString:@""]){
        self.errorMessageField.text = @"both fields are empty";
          UIAlertView *nousername = [[UIAlertView alloc]initWithTitle:@"Failed login" message:@"please put a username and login to sign in next time" delegate:self cancelButtonTitle:@"whatever" otherButtonTitles:nil];
          [nousername show];
    }
    }

- (IBAction)resetButtonWasPressed:(id)sender {
    NSLog(@"username and password were reseted");
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (IBAction)blueButtonWasPressed:(id)sender {
    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)purpleButtonWasPressed:(id)sender {
    self.view.backgroundColor = [UIColor purpleColor];
}

- (IBAction)brownButtonWasPressed:(id)sender {
    self.view.backgroundColor = [UIColor brownColor];
}
@end
