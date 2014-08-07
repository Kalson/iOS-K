//
//  STAGroupsTableViewController.m
//  Simple Tasks
//
//  Created by KaL on 7/30/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "STAGroupsTableViewController.h"
#import "STAItemsTableViewController.h"
#import "STANewGroupViewController.h"

@interface STAGroupsTableViewController ()

@end

@implementation STAGroupsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
//        self.groups = [@[] mutableCopy];
//
//        NSMutableArray *loadGroupsArray = [self loadGroupData];
        
//        if (loadGroupsArray) {
//            self.groups = loadGroupsArray;
//        }
//        
        
        self.groups = ([self loadGroupData]) ? [self loadGroupData]:[@[] mutableCopy];
        // loading save Data
        
       
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem *addNewGroup = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGroupClicked)];
    self.navigationItem.rightBarButtonItem = addNewGroup;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.title = @"Groups";
    
    
    ////// create a sublclass UIViewController named STANewGroupViewController
    ////// add textfield for group name
    ////// add 2 buttons for cancel and save
    ////// pass the groups array to the VC hint:@property
    ////// save creates NSMutableDictionary and adds it to the groups array
    ////// save and cancel "dismiss" the vc
    ////// do it for items vc to all this

    
// Uncomment the following line to preserve selection between presentations.
// self.clearsSelectionOnViewWillAppear = NO;
     
  
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@",self.groups);
    [self.tableView reloadData];
    
    [self saveGroupData];
}

- (void)addNewGroupClicked
{
    STANewGroupViewController *addNewGroupVC = [[STANewGroupViewController alloc]init];
    [self.navigationController presentViewController:addNewGroupVC animated:YES completion:nil];
    
     addNewGroupVC.groups = self.groups;
    ///// new important link
  
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
    return self.groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.groups[indexPath.row][@"name"];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STAItemsTableViewController *itemTVC = [[STAItemsTableViewController alloc]init];
    [self.navigationController pushViewController:itemTVC animated:YES];
    
    itemTVC.groupInfo = self.groups[indexPath.row];
    itemTVC.items = self.groups[indexPath.row][@"items"];
    ///// the important link that makes the creation - passing the groups file to the @properties of other subclass
    
//    itemTVC.groupInfo = self.groups[indexPath.row];
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        
        [self.groups removeObjectAtIndex:indexPath.row];
        
        // this save the fact that we deleted an object
        [self saveGroupData];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        // this removes the cell animation
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


- (void)saveGroupData
{
     // this is archiving the array
    NSData *groupData = [NSKeyedArchiver archivedDataWithRootObject:self.groups];
    [groupData writeToFile:[self groupFilePath] atomically:YES];
}

- (NSMutableArray *)loadGroupData
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];
}

- (NSString *)groupFilePath
{
    NSArray *documemtDIrectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = documemtDIrectories[0];
    
    return  [path stringByAppendingPathComponent:@"groups.data"];
}

- (BOOL)prefersStatusBarHidden {return YES;}



 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }


//
// // Override to support conditional rearranging of the table view.
// - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
// {
// // Return NO if you do not want the item to be re-orderable.
// return YES;
// }

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */



@end
