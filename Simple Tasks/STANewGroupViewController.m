//
//  STANewGroupViewController.m
//  Simple Tasks
//
//  Created by KaL on 7/30/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "STANewGroupViewController.h"
#import "STAGroupsTableViewController.h"

@interface STANewGroupViewController () <UITextFieldDelegate>

@end

@implementation STANewGroupViewController
{
    UIButton *checkButton;
    UIButton *xButton;
    UITextField *newGroupTextField;
    UILabel *line;
    UIImage *image;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    checkButton = [[UIButton alloc]initWithFrame:CGRectMake(165, 70, 100, 100)];
    [checkButton addTarget:self action:@selector(checkButtonWasCLicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkButton];
    checkButton.layer.borderWidth = 1;
    checkButton.layer.cornerRadius = 50;
    image = [UIImage imageNamed:@"group_save"];
    [checkButton setBackgroundImage:image forState:UIControlStateNormal];
    checkButton.adjustsImageWhenHighlighted = NO;
    
    
    xButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 - 110, 70, 100, 100)];
    [xButton addTarget:self action:@selector(xButtonWasCLicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:xButton];
    xButton.layer.borderWidth = 1;
    xButton.layer.cornerRadius = 50;
    image = [UIImage imageNamed:@"group_close"];
    [xButton setBackgroundImage:image forState:UIControlStateNormal];
    xButton.adjustsImageWhenHighlighted = NO;
    
    newGroupTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 40, 40)];
    [self.view addSubview:newGroupTextField];
//    newGroupTextField.layer.borderWidth = 1;
    newGroupTextField.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:30];
    newGroupTextField.delegate = self;
    
    UIView *fieldBar = [[UIView alloc]initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 1)];
    fieldBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:fieldBar];

//    line = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 300, 1)];
//    [self.view addSubview:line];
//    line.layer.borderWidth = 1;
    
//    NSNumber *priority = self.newgroup[@"priority"];
//    float priorityHue = [priority floatValue] / 360;
//    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    

}

- (void)setNewgroup:(NSMutableDictionary *)newgroup
{
    _newgroup = newgroup;
    STAGroupsTableViewController *groupTVC = [[STAGroupsTableViewController alloc]init];
    groupTVC.groups = newgroup[@"name"][0];
    NSMutableDictionary *newObject = [[NSMutableDictionary alloc]init];
    [groupTVC.groups addObject:newObject];
    NSLog(@"new group added = %@",newObject);
    
}

- (void)checkButtonWasCLicked{
      NSLog(@"check button was pressed");
    [self newgroup];
    [self dismissViewControllerAnimated:YES completion:nil];
   
}

- (void)xButtonWasCLicked{
      NSLog(@"x button was pressed");
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden {return YES;}

@end
