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
{
   
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.groups = [
  @[
                    [@{
                       @"name": @"Movies",
                       @"items": [@[
                                    [@{@"name": @"Gaurdians of the Galaxy",
                                      @"priority": @20
                                      } mutableCopy],
                                    [@{@"name": @"Expendables",
                                      @"priority":@40
                                      } mutableCopy],
                                    [@{@"name": @"TMNT",
                                      @"priority":@60
                                      } mutableCopy]
                                    
                                    ] mutableCopy]
                      } mutableCopy],
                    
                    [@{
                      @"name": @"Apps to Write",
                      @"items": [@[] mutableCopy]
                      } mutableCopy]
                  
                    
                    ] mutableCopy];
        
    }
    return self;
    

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem *addNewGroup = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGroupClicked)];
    self.navigationItem.rightBarButtonItem = addNewGroup;
    
    ////// create a sublclass UIViewController named STANewGroupViewController
    ////// add textfield for group name
    ////// add 2 buttons for cancel and save
    ////// pass the groups array to the VC hint:@property
    ////// save creates NSMutableDictionary and adds it to the groups array
    ////// save and cancel "dismiss" the vc
    ////// do it for items vc to all this

    
// Uncomment the following line to preserve selection between presentations.
// self.clearsSelectionOnViewWillAppear = NO;
    
// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    
  
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@",self.groups);
    [self.tableView reloadData];
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
    ///// the important link that makes the creation
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        
        [self.groups removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        // this removes the cell animation
        
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


- (BOOL)prefersStatusBarHidden {return YES;}


@end
