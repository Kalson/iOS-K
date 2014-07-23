//
//  MFCRootViewController.m
//  My First Code App
//
//  Created by KaL on 7/22/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MFCRootViewController.h"

@interface MFCRootViewController () <UITextFieldDelegate>

// declare private properties & methods
// @property (nonatomic) UILabel *somelabel
@end

@implementation MFCRootViewController {
    UILabel *someLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"init");
        
        self.view.backgroundColor = [UIColor colorWithRed:0.078f green:0.663f blue:0.733f alpha:1.0f];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(10.0, screenHeight - 60.0, screenWidth - 20.0, 50.0)];
    loginButton.backgroundColor = [UIColor blueColor];
    
   // [self loginButtonClicked];
    [loginButton addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    
    UITextField *usernameField = [[UITextField alloc]initWithFrame:CGRectMake(10.0, 30.0, screenWidth - 20.0, 50.0)];
    //usernameField.backgroundColor = [UIColor whiteColor];
    usernameField.backgroundColor = [UIColor whiteColor];
    usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameField.placeholder = @"username";
    usernameField.delegate = self;
    usernameField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:usernameField];
    
    someLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0, 70.0, 200.0, 50.0)];
    someLabel.text = @"username";
    [self.view addSubview:someLabel];
   
    NSLog(@"view did load");
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textfield should return");
    [textField resignFirstResponder];
    
    return YES;
}

- (void)loginButtonClicked
{
    NSLog(@"button was clicked");

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
