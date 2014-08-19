//
//  MCSTableViewController.m
//  My Cool Spots
//
//  Created by KaL on 8/18/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MCSTableViewController.h"

#import <AFNetworking/AFNetworking.h>

@interface MCSTableViewController ()

@end

@implementation MCSTableViewController
{
    NSMutableArray *venues;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.tableView.rowHeight = 60;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = [UIColor cyanColor];
        
//        NSMutableArray *groups = [[NSMutableArray alloc]init];
        
        
        AFHTTPRequestOperationManager *requestManager = [[AFHTTPRequestOperationManager alloc]init];
        
        [requestManager GET:@"https://api.foursquare.com/v2/venues/explore?oauth_token=XKO4L3TQREFJP4ANRXSXQLME4NBIXIS5FDIPVLZAWXGYGYBA&v=20140818&ll=37.785834,-122.406417" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
//            NSLog(@"location = %@",responseObject[@"response"][@"groups"][0][@"items"][0][@"venue"][@"name"]);
            
            venues = [@[]mutableCopy];
            
            // access the indexes of the items
            for (NSDictionary *index in responseObject[@"response"][@"groups"][0][@"items"]) {
                // add objects to the venues
                [venues addObject:index[@"venue"][@"name"]];
            }
            NSLog(@"%d",venues.count);
            [self.tableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@", error);
        }];
        
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return venues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
//    cell.textLabel.text = venues[indexPath.row];
    cell.textLabel.text = venues[indexPath.row];
    
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
