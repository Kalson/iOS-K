//
//  TLATweetCell.h
//  Tweet Like
//
//  Created by KaL on 8/11/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLATweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *heartCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (nonatomic) IBOutlet UIImageView *heartImage;

@end
