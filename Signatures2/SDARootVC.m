//
//  SIGRootVC.m
//  Signatures2
//
//  Created by KaL on 8/14/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SDARootVC.h"
#import "SDADrawVC.h"
#import "SDATableVC.h"
#import "SDADrawView.h"

@interface SDARootVC ()

@end

@implementation SDARootVC
{
    SDADrawVC *drawVC;
    SDATableVC *listVC;
    NSMutableArray *scribbling;
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
    // Do any additional setup after loading the view.
    
    // all the control maintaince stuff is done in this controller
    // (drawVC, listVC, button)
    
    drawVC = [[SDADrawVC alloc]init];
    drawVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    [self.view addSubview:drawVC.view];
    
    listVC = [[SDATableVC alloc]init];
    listVC.tableView.frame = CGRectMake(0, 200, SCREEN_WIDTH , SCREEN_HEIGHT - 200);
    [self.view addSubview:listVC.tableView];
    
    
    [self addChildViewController:drawVC];
    [self addChildViewController:listVC];
    
    UIButton *saveSignatureButton = [[UIButton alloc]initWithFrame:CGRectMake(40, 150, 100, 30)];
    saveSignatureButton.backgroundColor = [UIColor colorWithRed:0.000f green:1.000f blue:0.569f alpha:1.0f];
    saveSignatureButton.layer.cornerRadius = 15;
    [saveSignatureButton setTitle:@"SAVE" forState:UIControlStateNormal];
    [saveSignatureButton addTarget:self action:@selector(saveSignature) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveSignatureButton];
    
    UIButton *clearSignatureButton = [[UIButton alloc]initWithFrame:CGRectMake(180, 150, 100, 30)];
    clearSignatureButton.backgroundColor = [UIColor colorWithRed:1.000f green:0.212f blue:0.000f alpha:1.0f];
    clearSignatureButton.layer.cornerRadius = 15;
    [clearSignatureButton setTitle:@"CLEAR" forState:UIControlStateNormal];
    [clearSignatureButton addTarget:drawVC action:@selector(clearSignature) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearSignatureButton];
    
        NSLog(@"%@",self.childViewControllers);
}

- (void)saveSignature
{
    if (drawVC.drawView.scribbles.count == 0)
    {
        
    } else {
        UIImage * image = [drawVC getSignature];
        
        [listVC.signatures insertObject:image atIndex:0];
        [listVC.tableView reloadData];
    }
    
}


@end
