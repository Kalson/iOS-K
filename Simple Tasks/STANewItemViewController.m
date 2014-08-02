//
//  STAEditItemViewController.m
//  Simple Tasks
//
//  Created by KaL on 7/30/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "STANewItemViewController.h"

@interface STANewItemViewController () <UITextFieldDelegate>

@end

@implementation STANewItemViewController
{
    UIButton *saveButton;
    UIButton *cancelButton;
    UITextField *newItemTextField;
    UILabel *line;
    UIImage *image;
    UIView *fieldBar;
    float priority;
    UIView *dragView;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor colorWithHue:0.0 saturation:1.0 brightness:1.0 alpha:1.0];

        // Custom initialization
//         self.view.backgroundColor = [UIColor whiteColor];
//        NSNumber *priority = self.itemInfo[@"priority"];
//        float priorityHue = [priority floatValue] / 360;
//        self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    saveButton = [[UIButton alloc]initWithFrame:CGRectMake(165, SCREEN_HEIGHT - 130, 100, 100)];
    [saveButton addTarget:self action:@selector(saveButtonWasCLicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    saveButton.layer.borderWidth = 1;
    saveButton.layer.cornerRadius = 50;
    image = [UIImage imageNamed:@"item_save"];
    [saveButton setBackgroundImage:image forState:UIControlStateNormal];
    saveButton.adjustsImageWhenHighlighted = NO;
    
    
    cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 - 110, SCREEN_HEIGHT - 130, 100, 100)];
    [cancelButton addTarget:self action:@selector(cancelButtonWasCLicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    cancelButton.layer.borderWidth = 1;
    cancelButton.layer.cornerRadius = 50;
    image = [UIImage imageNamed:@"item_close"];
    [cancelButton setBackgroundImage:image forState:UIControlStateNormal];
    cancelButton.adjustsImageWhenHighlighted = NO;
    

    // Make a parent container
    dragView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 40, 40)];
    [dragView setTag:101];
    [self.view addSubview:dragView];

    // Create the first child to put in the parent container
    newItemTextField = [[UITextField alloc]initWithFrame:dragView.frame];
    newItemTextField.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:30];
    newItemTextField.placeholder = @"Item";
    newItemTextField.delegate = self;
    [dragView addSubview:newItemTextField];
    
    // Create the second child
    fieldBar = [[UIView alloc]initWithFrame:CGRectMake(10, 50, SCREEN_WIDTH - 40, 1)];
    fieldBar.backgroundColor = [UIColor blackColor];
    [dragView addSubview:fieldBar];
    
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 20)];
    newItemTextField.leftView = paddingView;
    newItemTextField.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches]anyObject];
    if ([[touch view]tag] == 101 && [touch tapCount] == 1) {
        [newItemTextField becomeFirstResponder];
    }
    [self changeColorWithLocation:[[touches allObjects][0] locationInView:self.view]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches]anyObject];
    CGPoint location = [touch locationInView:self.view];

    dragView.center = CGPointMake(newItemTextField.center.x, location.y);

//    if ([[touch view]tag] == 101){
//        [[touch view] setCenter:location];
//    }
    //    UITouch *touch = [touches allObjects][0];
    //
    //    CGPoint location = [touch locationInView:self.view];
    //    // no asterisk beacuse its a obj-c struct
    
    [self changeColorWithLocation:[[touches allObjects][0] locationInView:self.view]];
    
}

- (void)saveButtonWasCLicked{
    [self.itemInfo addObject:[@{
                              @"name": newItemTextField.text,
                              @"priority":[NSNumber numberWithFloat:priority]
                              } mutableCopy]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    NSLog(@"%f", priority);
}

- (void)cancelButtonWasCLicked{
    NSLog(@"x button was pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    self.itemInfo[@"name"] = textField.text;
    [textField resignFirstResponder];
    return YES;
}

- (void)changeColorWithLocation:(CGPoint)location
{
    priority = location.y / SCREEN_HEIGHT * 60;
    // screen height = 480
    
    float priorityHue = priority / 360;
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
     NSLog(@"y = %f",priority);
}

- (BOOL)prefersStatusBarHidden {return YES;}


@end



