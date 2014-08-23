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
    niceList.tableView.tag = 0;
    
    [niceList.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UITableViewController *naughtyList = [[UITableViewController alloc]init];
    naughtyList.title = @"Naughty";
    naughtyList.tableView.delegate = self;
    naughtyList.tableView.dataSource = self;
    naughtyList.tableView.tag = 1;

    
    [naughtyList.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];


    // table view controllers put into an array withinn the tabbar controller
    tabBarC.viewControllers = @[niceList,naughtyList];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView.tag == 0)
    {
        return niceArray.count;
    }
    
    if (tableView.tag == 1)
    {
        return nauughtArray.count;
    }
        
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *itemArray;
    // the array is used when it just a simple table view controllers that not clickable
    
    if (tableView.tag == 0)
    {
         itemArray = niceArray;
        // the item array is passed to the niceArray
    }
    
    if (tableView.tag == 1)
    {
        itemArray = nauughtArray;
        // the item array is passed to the naughtyArray

    }
    
    cell.textLabel.text = itemArray[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
