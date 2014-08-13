//
//  TLANewTweetVC.h
//  Tweet Like
//
//  Created by KaL on 8/11/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLANewTweetVC : UIViewController

@property (nonatomic) NSMutableArray *tweets;

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet UIImageView *saveTweet;
- (IBAction)saveButton:(id)sender;


@end
