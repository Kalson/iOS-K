//
//  STAItemsTableViewController.m
//  Simple Tasks
//
//  Created by KaL on 7/30/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "STAItemsTableViewController.h"
#import "STANewItemViewController.h"
#import "STAGroupsTableViewController.h"
#import "STAEditViewController.h"

@interface STAItemsTableViewController ()

@end

@implementation STAItemsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
          self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
      
//        self.groupInfo = ([self loadGroupData]) ? [self loadGroupData]:[@[]mutableCopy];
//        self.groupInfo = [@[]mutableCopy];
//        NSMutableArray *loadGroupArray = [self loadGroupData];
        
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem *addNewItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newItemClicked)];
    self.navigationItem.rightBarButtonItem = addNewItem;
}

- (void)newItemClicked
{
    STANewItemViewController *newGroupVC = [[STANewItemViewController alloc]init];
    [self.navigationController presentViewController:newGroupVC animated:YES completion:nil];
    
     newGroupVC.itemInfo = self.groupInfo[@"items"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
    [self saveGroupData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSMutableArray *items = self.groupInfo[@"items"];
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.groupInfo[@"items"][indexPath.row][@"name"];
    // indexpath after [@"items"] because its a dictionary
    
    // Configure the cell...
    NSNumber *priority = self.groupInfo[@"items"][indexPath.row][@"priority"];
    float priorityHue = [priority floatValue] / 360;
    cell.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STAEditViewController *ItemVC = [[STAEditViewController alloc]init];
    
    NSNumber *priorityHue = self.groupInfo[@"items"][indexPath.row][@"priority"];
    float priority = [priorityHue floatValue] / 360;
    ItemVC.view.backgroundColor = [UIColor colorWithHue:priority saturation:1.0 brightness:1.0 alpha:1.0];
    
    ItemVC.itemInfo = self.groupInfo[@"items"][indexPath.row];
    
    [self.navigationController pushViewController:ItemVC animated:YES];

//   editItemVC.itemInfo = self.groupInfo[@"items"][indexPath.row];
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self saveGroupData];
        
        [self.items removeObjectAtIndex:indexPath.row];
    
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)saveGroupData
{
    NSData *groupData = [NSKeyedArchiver archivedDataWithRootObject:self.groupInfo];
    [groupData writeToFile:[self groupFilePath] atomically:YES];
    
}

- (void)loadGroupData
{
    [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];
}

- (NSString *)groupFilePath
{
    NSArray *documentDictories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = documentDictories[0];
    
    return [path stringByAppendingString:@"groups.data"];
}



- (BOOL)prefersStatusBarHidden {return YES;}

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
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


@end



