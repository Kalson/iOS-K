//
//  SHAViewController.m
//  2nd Homework App
//
//  Created by KaL on 7/22/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SHAViewController.h"

@interface SHAViewController () <UITextFieldDelegate>


@end

@implementation SHAViewController {
    UITextField *usernameTextfield;
    UITextField *passwordTextfield;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithRed:0.227f green:0.518f blue:0.733f alpha:1.0f];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 10.0, 20.0)];
    UIView *paddingView1 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 10.0, 20.0)];
    UIView *paddingView2 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 10.0, 20.0)];
    UIView *paddingView3 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 10.0, 20.0)];
    
#pragma Mark - Buttons
    
    UIButton *resetButton = [[UIButton alloc]initWithFrame:CGRectMake(10.0, screenHeight - 120.0, screenWidth - 20.0, 50.0)];
    resetButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:resetButton];
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(resetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    resetButton.layer.cornerRadius = 5;
    
    
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(10.0, screenHeight - 60.0, screenWidth - 20.0, 50.0)];
    loginButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:loginButton];
    [loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    loginButton.layer.cornerRadius = 5;
    
    UIButton *greenButton = [[UIButton alloc]initWithFrame:CGRectMake(25.0, 280.0, 50.0, 50.0)];
    greenButton.backgroundColor = [UIColor greenColor];
    [greenButton addTarget:self action:@selector(greenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:greenButton];
    greenButton.layer.cornerRadius = 25;
    
    UIButton *redButton = [[UIButton alloc]initWithFrame:CGRectMake(80.0, 280.0, 50.0, 50.0)];
    redButton.backgroundColor = [UIColor redColor];
    [redButton addTarget:self action:@selector(redButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
    redButton.layer.cornerRadius = 25;
    
    UIButton *yellowButton = [[UIButton alloc]initWithFrame:CGRectMake(135.0, 280.0, 50.0, 50.0)];
    yellowButton.backgroundColor = [UIColor yellowColor];
    [yellowButton addTarget:self action:@selector(yellowButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yellowButton];
    yellowButton.layer.cornerRadius = 25;
    
    UIButton *orangeButton = [[UIButton alloc]initWithFrame:CGRectMake(190.0, 280.0, 50.0, 50.0)];
    orangeButton.backgroundColor = [UIColor orangeColor];
    [orangeButton addTarget:self action:@selector(orangeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orangeButton];
    orangeButton.layer.cornerRadius = 25;
    
    UIButton *purpleButton = [[UIButton alloc]initWithFrame:CGRectMake(245.0, 280.0, 50.0, 50.0)];
    purpleButton.backgroundColor = [UIColor purpleColor];
    [purpleButton addTarget:self action:@selector(purpleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:purpleButton];
    purpleButton.layer.cornerRadius = 25;
    
#pragma Mark - Textfields
    
    usernameTextfield = [[UITextField alloc]initWithFrame:CGRectMake(10.0, 30.0, screenWidth - 20.0, 50.0)];
    usernameTextfield.backgroundColor = [UIColor whiteColor];
    usernameTextfield.placeholder = @"username";
    usernameTextfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameTextfield.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameTextfield.delegate = self;
    usernameTextfield.leftView = paddingView;
    usernameTextfield.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:usernameTextfield];
    usernameTextfield.layer.cornerRadius = 5;
    
    passwordTextfield = [[UITextField alloc]initWithFrame:CGRectMake(10.0, 90.0, screenWidth - 20.0, 50.0)];
    passwordTextfield.backgroundColor = [UIColor whiteColor];
    passwordTextfield.placeholder = @"password";
    passwordTextfield.secureTextEntry = YES;
    passwordTextfield.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordTextfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordTextfield.layer.cornerRadius = 5;
    passwordTextfield.delegate = self;
    passwordTextfield.leftView = paddingView1;
    passwordTextfield.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:passwordTextfield];
    
    UITextField *emailTextField = [[UITextField alloc]initWithFrame:CGRectMake(10.0, 150.0, screenWidth - 20.0 , 50.0)];
    emailTextField.backgroundColor = [UIColor whiteColor];
    emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailTextField.layer.cornerRadius = 5;
    emailTextField.placeholder = @"email";
    emailTextField.leftView = paddingView2;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    emailTextField.delegate = self;
    [self.view addSubview:emailTextField];
    
    UITextField *phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(10.0, 210.0, screenWidth - 20.0 , 50.0)];
    phoneTextField.backgroundColor = [UIColor whiteColor];
    phoneTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    phoneTextField.layer.cornerRadius = 5;
    phoneTextField.placeholder = @"phone";
    phoneTextField.leftView = paddingView3;
    phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneTextField.delegate = self;
    [self.view addSubview:phoneTextField];
    

    
}

- (void)loginButtonClicked{
    NSLog(@"login button was clicked");
    
    if ([usernameTextfield.text isEqualToString:@""]) {
        UIAlertView *noUsername = [[UIAlertView alloc]initWithTitle:@"Failed Login" message:@"Please put a username in next time" delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
        [noUsername show];
    }
    
}

- (void)resetButtonClicked{
    self.view.backgroundColor = [UIColor colorWithRed:0.227f green:0.518f blue:0.733f alpha:1.0f];
    usernameTextfield.text = @"";
    NSLog(@"reset button was clicked");
}

- (void)greenButtonClicked{
    NSLog(@"green button was pressed");
    self.view.backgroundColor = [UIColor greenColor];
    
}

- (void)redButtonClicked{
    NSLog(@"red button was pressed");
    self.view.backgroundColor = [UIColor redColor];
}
- (void)yellowButtonClicked{
    NSLog(@"yellow button was pressed");
    self.view.backgroundColor = [UIColor yellowColor];
}
- (void)orangeButtonClicked{
    NSLog(@"orange button was pressed");
    self.view.backgroundColor = [UIColor orangeColor];
}
- (void)purpleButtonClicked{
    NSLog(@"purple button was pressed");
    self.view.backgroundColor = [UIColor purpleColor];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end


