//
//  TLAViewTweetsVC.h
//  Tweet Like
//
//  Created by KaL on 8/11/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLAViewTweetsVC : UIViewController

@property (nonatomic) NSDictionary *tweet;
@property (weak, nonatomic) IBOutlet UIButton *saveViewedTweet;

- (IBAction)saveViewedTweet:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *editViewedTweet;


// iboutlet for textview

@end
