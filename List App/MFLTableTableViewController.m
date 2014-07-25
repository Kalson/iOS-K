//
//  MFLTableTableViewController.m
//  List App
//
//  Created by KaL on 7/23/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MFLTableTableViewController.h"

@interface MFLTableTableViewController ()

@property (nonatomic) NSArray *days;
@property (nonatomic) NSArray *students;
@property (nonatomic) NSArray *colors;
@property (nonatomic) NSArray *sizes;
@property (nonatomic) NSArray *info;

// create an array for students - NSStrings

// create an array for colors - UIColors

// create an array for sizes - NSNumbers

@end

@implementation MFLTableTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization

        self.days = @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday", @"Friday",@"Saturday",@"Sunday"];
        self.students = @[@"David Drake",@"Meritt Tidwell", @"Joseph Lau", @"Jaime Connor", @"Steve Sneller",@"Jeremy Butler", @"Nick Peterson"];
        self.colors = @[[UIColor redColor],[UIColor orangeColor], [UIColor yellowColor],[UIColor greenColor],[UIColor colorWithRed:0.243f green:0.643f blue:0.502f alpha:1.0f], [UIColor blueColor], [UIColor purpleColor]];
        self.sizes = @[@"20",@"22",@"24",@"26",@"28",@"30",@"32"];
        
        // add the last 3 days
        
        // set 7 students
        
        // set 7 colors
        
        // set 7 numbers (20 - 40)
        
        self.info = @[
                      @{@"day": @"Monday",
                        @"color":[UIColor redColor],
                        @"student":@"David Drake",
                        @"size":@"20"},
                      @{@"day": @"Tuesday",
                        @"color": [UIColor orangeColor],
                        @"student":@"Meritt Tidwell",
                        @"size":@"22"},
        @{@"day": @"Wednesday"}];
        

    
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.days.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [self.days objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.students objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [self.colors objectAtIndex:indexPath.row];
     NSNumber *size = self.sizes[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:[size intValue]];
    
  //  NSDictionary *infoItem = self.info[indexPath.row];
    
  //  NSString *day = infoItem[@"day"];
   // UIColor *color = infoItem[@"color"];
   

   // listItem = self.listItems[indexPath.row];
 //   NSLog(@"listItems = %@",_days);
    
   

    
    // there is a sub text option that will be set by the student name
    
    // set background color to color in array
    
    // set the text label font size to a number from the last array
    
    // Configure the cell...
    
    return cell;
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


@end
