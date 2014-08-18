//
//  TLATweetCell.h
//  Tweet Like
//
//  Created by KaL on 8/11/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFObject;
// run this to create the PFObject @property

@protocol TLATweetCellDelegate;

@interface TLATweetCell : UITableViewCell

@property (nonatomic) PFObject *tweet;

@property (weak, nonatomic) IBOutlet UILabel *heartCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
- (IBAction)heartTapped:(id)sender;

@property (nonatomic,assign) id <TLATweetCellDelegate> delegate;

@end

@protocol TLATweetCellDelegate <NSObject>

- (void)heartsUpdated;

@end
