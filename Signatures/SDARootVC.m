//
//  SDARootVC.m
//  Signatures
//
//  Created by KaL on 8/13/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SDARootVC.h"
#import "SDATVC.h"
#import "SDAVC.h"

@interface SDARootVC ()

@end

@implementation SDARootVC

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
    
    SDAVC *drawView = [[SDAVC alloc]init];
    drawView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 165);
    [self.view addSubview:drawView.view];
    
    SDATVC *listTVC = [[SDATVC alloc]init];
    listTVC.tableView.frame = CGRectMake(0, SCREEN_HEIGHT - 310, SCREEN_WIDTH, 310);
    [self.view addSubview:listTVC.tableView];
    
     self.view.backgroundColor = [UIColor grayColor];

}

- (BOOL)prefersStatusBarHidden{return YES;}


@end
