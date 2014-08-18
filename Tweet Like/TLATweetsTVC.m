//
//  TLATweetsTVC.m
//  Tweet Like
//
//  Created by KaL on 8/11/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "TLATweetsTVC.h"
#import "TLATweetCell.h"
#import "TLANewTweetVC.h"
#import "TLAViewTweetsVC.h"

#import "AFNetworking.h"

#import <Parse/Parse.h>

@interface TLATweetsTVC () <TLATweetCellDelegate>

@end

@implementation TLATweetsTVC
{
    NSMutableArray *tweetsLikes;
   
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // Custom initialization
        
        BOOL useJos = NO;
        if (useJos)
        {
            [Parse setApplicationId:@"L1IPX1pFO1iLCRbZ3Hu4o7LCwlkpktqFTKI1zzRt"
                          clientKey:@"Jjgc6YFyzuo734oav544IZKAPawTozNtNU12N6Wg"];
        } else {
            // wanna use mine
            [Parse setApplicationId:@"aOwwRJFyjxfQnyXvqAohpLb4QauKnJwFSVI09prT"
                          clientKey:@"TldDPBqCimOGd0WF1ekd7JhOTxijzt5cNuAa6OmG"];
            
        }
        ///// after Twitter JSON is requested, query Parse where key @"id" isEqualTo: tweet[@"id"]
        ///// if query returns no results... save Tweet PFObject based on tweet.
        ///// if query returns results... do nothing
        ///// after looping thru Twitter JSON objects, query Parse for Tweets objects and fill tableview with the result
        ///// when clicking ona heart update the cell, also find the Tweet object that matches its @"id" and update the @"hearts" value
        
        
        
        
 
        
  
        tweetsLikes = [@[]mutableCopy]; // fake data was inside the array
        
//        tweets = ([self loadGroupData]) ? ([self loadGroupData]) : [@[]mutableCopy];
        
        // request from twitter Jo's Json to parse
        AFHTTPRequestOperationManager *requestManager = [[AFHTTPRequestOperationManager alloc]init];
        [requestManager GET:@"http://jo2.co/twitter.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //// NEW WAY
            
            // 2nd request is to query parse to get all the tweet likes available
            PFQuery * queryAll = [PFQuery queryWithClassName:@"Tweet"];
            [queryAll findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
              
                for (NSDictionary * tweet in responseObject)
                {
                    BOOL tweetLikeFound = NO;
                    
                    for (PFObject * tweetLike in objects)
                    {
                        if ([tweet[@"id"] isEqual:tweetLike[@"id"]])
                        {
                            tweetLikeFound = YES;
                            
                            [tweetsLikes addObject:tweetLike];
                        }
                    }
                    
                    if (!tweetLikeFound) {
                        PFObject *newTweetLike = [PFObject objectWithClassName:@"Tweet"];
                        [newTweetLike setObject:tweet[@"id"] forKey:@"id"];
                        [newTweetLike setObject:tweet[@"text"] forKey:@"text"];
                        [newTweetLike setObject:@0 forKey:@"hearts"];

                        [newTweetLike saveInBackground];
                        
                        [tweetsLikes addObject:newTweetLike];
                    }
                }
                
                [self.tableView reloadData];
            }];
            
            
            ///// OLD WAY
            
//            for (NSDictionary *tweet in responseObject)
//            {
////                [tweets addObject:   [@{
////                                        @"id" : tweet[@"id"],
////                                        @"text": tweet[@"text"],
////                                        @"hearts": @0
////                                        }mutableCopy]];
//                
//                // this is to check if Jo's tweets already exist in the Parse database
//                PFQuery *query = [PFQuery queryWithClassName:@"Tweet"];
////                [query whereKey:@"hearts" equalTo:@99];
//                [query whereKey:@"id" equalTo:tweet[@"id"]];
////                query.limit = 1;
//                [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//                    
//                    // objects is the results
//                    NSLog(@"%@",objects);
//                    
//                    // if objects.count > 0
//                    
//                    if (objects.count > 0)
//                    {
//                        // do nothing
//                    } else {
//                       // if query returns no results... save Tweet PFObject based on tweet.
//                        
//                        // this sets objects to Parse (set new objects)
//                        PFObject * tweetObject = [PFObject objectWithClassName:@"Tweet"];
//                        [tweetObject setObject:tweet[@"id"] forKey:@"id"];
//                        [tweetObject setObject:tweet[@"text"] forKey:@"text"];
//                        [tweetObject setObject:@0 forKey:@"hearts"];
//                        
//                        [tweetObject saveInBackground];
//                    }
//                    
//                }];
//            
//            }
//    
       
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            // new query object
            
        }];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header_logo"]];
    
    logo.frame = CGRectMake(0, 0, 121, 24);
    logo.center = self.navigationController.navigationBar.center;
    
    [self.navigationController.navigationBar addSubview:logo];
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.separatorColor = [UIColor colorWithRed:0.192f green:0.522f blue:1.000f alpha:1.0f];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
//    [self saveGroupData];
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
    return tweetsLikes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    PFObject *tweet = tweetsLikes[indexPath.row];

    // so its not null
    cell.heartCountLabel.text = (tweet[@"hearts"]) ? [NSString stringWithFormat:@"%@",tweet[@"hearts"]] : @"0";
//    cell.heartCountLabel.text = [NSString stringWithFormat:@"%@",tweet[@"hearts"]];
    cell.tweetTextView.text = tweet[@"text"];
    
    // set tweet
    cell.tweet = tweet;
    // passing the tweet property from the sublclass to the tweet
    
    cell.delegate = self;
    
    NSLog(@"%@",tweet[@"text"]);
    
    // Configure the cell...
    
    return cell;
}

- (void)heartsUpdated
{
    [self.tableView reloadData];
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [tweetsLikes removeObjectAtIndex:indexPath.row];
//        [self saveGroupData];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
// before the transition (when you want to pass info)
{
    
    if ([segue.identifier isEqualToString:@"showNewTweetVC"])
    {
        TLANewTweetVC *newTweetVC = segue.destinationViewController;
        newTweetVC.tweets = tweetsLikes;
    }
    
    if ([segue.identifier isEqualToString:@"viewTweet"])
    {
        TLAViewTweetsVC *viewTweets = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        viewTweets.tweet = tweetsLikes[indexPath.row];
        
        // set textview.text = viewTweets.tweet[@"text"];
    }
   
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


//- (void)saveGroupData
//{
//    NSData *groupData = [NSKeyedArchiver archivedDataWithRootObject:tweets];
//    [groupData writeToFile:[self groupFilePath] atomically:YES];
//}
//
//- (NSMutableArray *)loadGroupData
//{
//    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];
//}
//
//- (NSString *)groupFilePath
//{
//    NSArray *documentDicrectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = documentDicrectories[0];
//    
//    return [path stringByAppendingString:@"tweets.data"];
//}


@end
