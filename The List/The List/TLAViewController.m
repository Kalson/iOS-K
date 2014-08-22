//
//  TLAViewController.m
//  The List
//
//  Created by KaL on 8/22/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "TLAViewController.h"

@interface TLAViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TLAViewController
{
    
    // two arrays for the 2 different table view controllers
    NSMutableArray *niceArray;
    NSMutableArray *nauughtArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    niceArray = [@[@"Helper Robots",@"Some Humans"]mutableCopy];
    nauughtArray = [@[@"Invading Aliens",@"Killer Robots",@"Jaws"]mutableCopy];
    
    UITabBarController *tabBarC = [[UITabBarController alloc]init];
    [self.view addSubview:tabBarC.view];
    [self addChildViewController:tabBarC];
    
    UITableViewController *niceList = [[UITableViewController alloc]init];
    niceList.title = @"Nice";
    niceList.tableView.delegate = self;
    niceList.tableView.dataSource = self;
    
    [niceList.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UITableViewController *naughtyList = [[UITableViewController alloc]init];
    naughtyList.title = @"Naughty";
    naughtyList.tableView.delegate = self;
    naughtyList.tableView.dataSource = self;
    
    [naughtyList.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];


    // table view controllers put into an array withinn the tabbar controller
    tabBarC.viewControllers = @[niceList,naughtyList];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
