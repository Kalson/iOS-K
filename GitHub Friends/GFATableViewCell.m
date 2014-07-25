//
//  GFATableViewCell.m
//  GitHub Friends
//
//  Created by KaL on 7/24/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "GFATableViewCell.h"

@implementation GFATableViewCell{
    UILabel *friendName;
    UIImageView *friendImage;
    UILabel *friendLocation;
    UILabel *friendFollowers;
    UILabel *friendFollowing;
    UIButton *profileButton;
    UIButton *gistsButton;
    
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        friendName = [[UILabel alloc]initWithFrame:CGRectMake(65, 0, 140, 40)];
        [self.contentView addSubview:friendName];
        friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        [self.contentView addSubview:friendImage];
        friendLocation = [[UILabel alloc]initWithFrame:CGRectMake(65, 30, 200, 20)];
        [self.contentView addSubview:friendLocation];
        friendFollowers = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 85, 40)];
        [self.contentView addSubview:friendFollowers];
        friendFollowing = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 200, 20)];
        [self.contentView addSubview:friendFollowing];
        profileButton = [[UIButton alloc]initWithFrame:CGRectMake(215, 33, 90, 20)];
        [self.contentView addSubview:profileButton];
        gistsButton = [[UIButton alloc]initWithFrame:CGRectMake(215, 55, 90, 20)];
        [self.contentView addSubview:gistsButton];
        
        
    }
    return self;
}


//   @"login": @"joalbright",
//   @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
//   @"name": @"Jo Albright",
//   @"blog": @"jo2.co",
//   @"location": @"Atlanta, Ga",
//   @"email": @"me@jo2.co"

- (void)setFriendInfo:(NSDictionary *)friendInfo{
    
    self.layer.borderWidth = 0.30;
    self.layer.borderColor = [[UIColor lightGrayColor]CGColor];

    
    _friendInfo = friendInfo;
    
    NSLog(@"%@", friendInfo);
    friendName.text = friendInfo[@"name"];
    friendName.font = [UIFont fontWithName:@"HelveticaNeue-Ultralight" size:30];
    
    
    NSURL *url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    friendImage.image = [UIImage imageWithData:data];
    friendImage.layer.cornerRadius = 20;
    friendImage.layer.masksToBounds = YES;
   

    friendLocation.text = friendInfo[@"location"];
    friendLocation.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:10];
    
    friendFollowers.text = friendInfo[@"Followers"];
    friendFollowers.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:10];
    
    friendFollowing.text = friendInfo[@"Following"];
    friendFollowing.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:10];
    
    [profileButton addTarget:self action:@selector(profileButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    profileButton.backgroundColor = [UIColor lightGrayColor];
    profileButton.titleLabel.font = [UIFont systemFontOfSize:10];
    profileButton.layer.cornerRadius = 10;
    [profileButton setTitle:@"PROFILE" forState:UIControlStateNormal];
    
    [gistsButton addTarget:self action:@selector(gistsButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    gistsButton.backgroundColor = [UIColor lightGrayColor];
    gistsButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [gistsButton setTitle:@"GISTS" forState:UIControlStateNormal];
    gistsButton.layer.cornerRadius = 10;
    
  

}

- (void)profileButtonWasClicked{
    NSLog(@"Profile button was clicked");
}

- (void)gistsButtonWasClicked{
    NSLog(@"Gists button was clicked");
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
