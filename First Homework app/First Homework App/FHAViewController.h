//
//  FHAViewController.h
//  First Homework App
//
//  Created by KaL on 7/21/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHAViewController : UIViewController

// 2 textfields (username, password)

// 3 labels (username = username.text, password = password.text, error = error message) 3 different error messages

// 2 button (login, reset)

// 3 buttons (no text, different background colors, when you tap them, change the view background color to match the button)
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *errorMessageField;

- (IBAction)loginButtonWasPressed:(id)sender;
- (IBAction)resetButtonWasPressed:(id)sender;
- (IBAction)blueButtonWasPressed:(id)sender;
- (IBAction)purpleButtonWasPressed:(id)sender;
- (IBAction)brownButtonWasPressed:(id)sender;

@end
