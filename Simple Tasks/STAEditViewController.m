//
//  STAEditViewController.m
//  Simple Tasks
//
//  Created by KaL on 7/31/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "STAEditViewController.h"

@interface STAEditViewController () <UITextFieldDelegate>

@end

@implementation STAEditViewController
{
    UITextField *itemNameField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)setItemInfo:(NSMutableDictionary *)itemInfo
{
    _itemInfo = itemInfo;
    
    itemNameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH - 40, 50)];
    itemNameField.text = self.itemInfo[@"name"];
    [self.view addSubview:itemNameField];
    itemNameField.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    self.itemInfo[@"name"] = textField.text;
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeColorWithLocation:[[touches allObjects][0] locationInView:self.view]];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //    UITouch *touch = [touches allObjects][0];
    //
    //    CGPoint location = [touch locationInView:self.view];
    //    // no asterisk beacuse its a obj-c struct
    
    [self changeColorWithLocation:[[touches allObjects][0] locationInView:self.view]];
    
}

- (void)changeColorWithLocation:(CGPoint)location
{
    float priority = location.y / SCREEN_HEIGHT * 60;
    // screen height = 480
    NSLog(@"y = %f",priority/60.0);
    
    self.itemInfo[@"priority"] = @(priority);
    // NSNumber = @()
    
    float priorityHue = priority / 360;
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
}
- (BOOL)prefersStatusBarHidden {return YES;}

@end
