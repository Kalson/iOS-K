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
    UIButton *saveButton;
    UIButton *cancelButton;
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
    saveButton = [[UIButton alloc]initWithFrame:CGRectMake(165, 70, 100, 100)];
    [saveButton addTarget:self action:@selector(saveButtonWasCLicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    saveButton.layer.borderWidth = 1;
    saveButton.layer.cornerRadius = 50;
    image = [UIImage imageNamed:@"group_save"];
    [saveButton setBackgroundImage:image forState:UIControlStateNormal];
    saveButton.adjustsImageWhenHighlighted = NO;
    
    
    cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0 - 110, 70, 100, 100)];
    [cancelButton addTarget:self action:@selector(cancelButtonWasCLicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    cancelButton.layer.borderWidth = 1;
    cancelButton.layer.cornerRadius = 50;
    image = [UIImage imageNamed:@"group_close"];
    [cancelButton setBackgroundImage:image forState:UIControlStateNormal];
    cancelButton.adjustsImageWhenHighlighted = NO;
    
    newGroupTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 40, 40)];
    [self.view addSubview:newGroupTextField];
//    newGroupTextField.layer.borderWidth = 1;
    newGroupTextField.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:30];
    newGroupTextField.placeholder = @"Group";
    newGroupTextField.delegate = self;
    [newGroupTextField becomeFirstResponder];
    
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 20)];
    newGroupTextField.leftView = paddingView;
    newGroupTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    UIView *fieldBar = [[UIView alloc]initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH - 40, 1)];
    fieldBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:fieldBar];

//    line = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 300, 1)];
//    [self.view addSubview:line];
//    line.layer.borderWidth = 1;
    
//    NSNumber *priority = self.newgroup[@"priority"];
//    float priorityHue = [priority floatValue] / 360;
//    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    

}

//- (void)setGroups:(NSMutableArray *)groups
//{
////    STAGroupsTableViewController *groupTVC = [[STAGroupsTableViewController alloc]init];
////    groupTVC.groups = groups[@"name"][0];
////    NSMutableDictionary *newObject = [[NSMutableDictionary alloc]init];
////    [groupTVC.groups addObject:newObject];
////    NSLog(@"new group added = %@",newObject);
//    
//}

- (void)saveButtonWasCLicked{
    [self.groups addObject:[@{
                              @"name": newGroupTextField.text,
                              @"items": [@[] mutableCopy]
                              } mutableCopy]];
    [self dismissViewControllerAnimated:YES completion:nil];
 
}

- (void)cancelButtonWasCLicked{
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
