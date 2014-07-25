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

@interface GFATableViewController ()

@end

@implementation GFATableViewController {
    NSMutableArray *githubFriends;
    UIButton *searchButton;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        githubFriends = [@[
                          @{
          
                            @"login": @"joalbright",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                            @"html_url": @"https://github.com/joalbright",
                            @"name": @"Jo Albright",
                            @"blog": @"jo2.co",
                            @"location": @"Atlanta, Ga",
                            @"email": @"me@jo2.co",
                            @"Followers": @"Followers: 28",
                            @"Following": @"Following: 43"},
                          
                          @{@"name": @"Kalson Kalu",
                            @"location": @"Houston, TX",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/7114996?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 4"},
                          @{@"name": @"Steve Sneller",
                            @"location": @"Marietta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/8129918?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Jaime Connor",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224727?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Joseph Lau",
                            @"location": @"San Francisco, CA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/7451830?",
                            @"Followers": @"Followers: 1",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Jeremy Butler",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/7903562?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Shane Sniteman",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/4793213?",
                            @"Followers": @"Followers: 22",
                            @"Following": @"Following: 35"},
                          @{@"name": @"Eric Seidel",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224720?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Eric Williams",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224735?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Arthur Boia",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224728?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Nick",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224722?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Daniel Merrill",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/8224723?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Josh Hendershot",
                            @"location": @"Seattle, WA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/7279926?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Rene Candelier",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/4494771?",
                            @"Followers": @"Followers: 1",
                            @"Following": @"Following: 2"},
                          @{@"name": @"Meritt Tidwell",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/7989843?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                          @{@"name": @"Katlyn Schawaebe",
                            @"location": @"Atlanta, GA",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/6909470?",
                            @"Followers": @"Followers: 0",
                            @"Following": @"Following: 0"},
                        
                           
                            ] mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.tableView.tableHeaderView = headerView;
    
    UITextField *searchBar = [[UITextField alloc]initWithFrame:CGRectMake(10, 40, 250, 40)];
    searchBar.layer.borderWidth = 1;
    searchBar.placeholder = @"Search";
    [self.view addSubview:searchBar];
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 20)];
    searchBar.leftView = paddingView;
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 40, 40, 40)];
    [self.view addSubview:searchButton];
    searchButton.backgroundColor = [UIColor grayColor];
    searchButton.layer.cornerRadius = 20;
    [searchButton addTarget:self action:@selector(searchbarWasPressed) forControlEvents:UIControlEventTouchUpInside];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)searchbarWasPressed{
    NSLog(@"Search Bar Was Pressed");
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

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
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select row at %@",indexPath);
    GFAViewController *profileView = [[GFAViewController alloc]init];
    [self.navigationController pushViewController:profileView animated:YES];
    profileView.view.backgroundColor = [UIColor lightGrayColor];
    
    profileView.friendInfo2 = githubFriends[indexPath.row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
