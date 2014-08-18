//
//  GFATableViewController.m
//  GitHub Friends
//
//  Created by KaL on 7/24/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "GFATableViewController.h"
#import "GFATableViewCell.h"
#import "GFAViewController.h"
#import "GRAGithubRequest.h"


@interface GFATableViewController () <UITextFieldDelegate>

@end

@implementation GFATableViewController {
    NSMutableArray *githubFriends;
    UIButton *searchButton;
    UIImageView *searchButtonImage;
}


// add an object to the beginning
// add an object to the end


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        githubFriends = [@[] mutableCopy];
        
        NSArray *loadedUsers = [GRAGithubRequest loadUsers];
        
        if (loadedUsers) {
            githubFriends = [loadedUsers mutableCopy];
        }
        
        self.tableView.rowHeight = 80;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.backgroundColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerView.backgroundColor = [UIColor colorWithRed:0.984f green:0.008f blue:0.263f alpha:1.0f];
    self.tableView.tableHeaderView = headerView;
  
    
    self.searchBar = [[UITextField alloc]initWithFrame:CGRectMake(10, 11, 250, 40)];
    self.searchBar.placeholder = @"Search";
    self.searchBar.layer.cornerRadius = 5;
    [headerView addSubview:self.searchBar];
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.searchBar.leftView = paddingView;
    self.searchBar.leftViewMode = UITextFieldViewModeAlways;
    self.searchBar.delegate = self;
    self.searchBar.backgroundColor = [UIColor whiteColor];
    


    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 11, 40, 40)];
    [headerView addSubview:searchButton];
    searchButton.backgroundColor = [UIColor grayColor];
    searchButton.layer.cornerRadius = 20;
    [searchButton addTarget:self action:@selector(searchbarWasPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *sbimage = [UIImage imageNamed:@"searchButton"];
    [searchButton setImage:sbimage forState:UIControlStateNormal];
    // try.dot notation of this
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapdismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:YES];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
#pragma mark - Helper Methods
    
}

- (void)tapdismissKeyboard
{
    [self.searchBar resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)searchbarWasPressed{
    NSLog(@"Search Bar Was Pressed");
    
    NSDictionary *userInfo = [GRAGithubRequest requestUserInfo:self.searchBar.text];
    // add an object to the bottom
//    [githubFriends addObject:userInfo];
    [self.tableView reloadData];
    
    // add an object to the beginning
    [githubFriends insertObject:userInfo atIndex:0];
    [GRAGithubRequest saveUsers:githubFriends];
    
    self.searchBar.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return githubFriends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil){
        cell = [[GFATableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.friendInfo = githubFriends[indexPath.row];
    cell.NavigationController = self.navigationController;
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select row at %@",indexPath);
 
   
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [githubFriends removeObjectAtIndex:indexPath.row];
        
        [GRAGithubRequest saveUsers:githubFriends];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
