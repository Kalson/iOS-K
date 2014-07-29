//
//  GFATableViewCell.m
//  GitHub Friends
//
//  Created by KaL on 7/24/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "GFATableViewCell.h"
#import "GFAViewController.h"
#import "GFATableViewController.h"


@implementation GFATableViewCell{
    UILabel *friendName;
    UIImageView *friendImage;
    UILabel *friendLocation;
    UIButton *profileButton;
    UIButton *gistsButton;
    UILabel *gistLabel;
    UILabel *followersLabel;
    UIImageView *ArrowImageView;
    UILabel *neutralImage;
    UILabel *followerText;
    
    
//    UILabel *friendFollowers;
//    UILabel *friendFollowing;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        friendName = [[UILabel alloc]initWithFrame:CGRectMake(90, 0, 140, 40)];
        [self.contentView addSubview:friendName];
        friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        [self.contentView addSubview:friendImage];
        friendLocation = [[UILabel alloc]initWithFrame:CGRectMake(90, 30, 200, 20)];
        [self.contentView addSubview:friendLocation];
        gistsButton = [[UIButton alloc]initWithFrame:CGRectMake(260, 50, 50, 20)];
        [self.contentView addSubview:gistsButton];
        profileButton = [[UIButton alloc]initWithFrame:CGRectMake(290, 10, 20, 20)];
        [self.contentView addSubview:profileButton];
        [profileButton setBackgroundImage:[UIImage imageNamed:@"profileArrow"] forState:UIControlStateNormal];
        [self.contentView addSubview:profileButton];
        gistLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 50, 20, 20)];
        [self.contentView addSubview:gistLabel];
        followersLabel = [[UILabel alloc]initWithFrame:CGRectMake(105, 50, 20, 20)];
        [self.contentView addSubview:followersLabel];
        ArrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(90, 50, 20, 20)];
        [self.contentView addSubview:ArrowImageView];
        ArrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(90, 50, 20, 20)];
        [self.contentView addSubview:ArrowImageView];
        neutralImage = [[UILabel alloc]initWithFrame:CGRectMake(90, 50, 20, 20)];
        [self.contentView addSubview:neutralImage];
        followerText = [[UILabel alloc]initWithFrame:CGRectMake(130, 50, 80, 20)];
        [self.contentView addSubview:followerText];
        

        // another way to set an image on a button
        //    UIImage *image = [UIImage imageNamed:@"profileArrow"];
        //    [profileButton  setImage:image forState:UIControlStateNormal];


        
     /*   friendFollowers = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 85, 40)];
        [self.contentView addSubview:friendFollowers];
        friendFollowing = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 200, 20)];
        [self.contentView addSubview:friendFollowing]; 
      
      
      */
        
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
    
    self.backgroundColor = [UIColor darkGrayColor];

    
    _friendInfo = friendInfo;
    
//    NSLog(@"%@", friendInfo);
    friendName.text = friendInfo[@"name"];
    friendName.font = [UIFont fontWithName:@"HelveticaNeue-Ultralight" size:20];
    friendName.textColor = [UIColor whiteColor];
    
    
    NSURL *url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    friendImage.image = [UIImage imageWithData:data];

    friendLocation.text = friendInfo[@"location"];
    friendLocation.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:10];
    friendLocation.textColor = [UIColor whiteColor];
    
    [profileButton addTarget:self action:@selector(profileButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    
    gistLabel.backgroundColor = [UIColor whiteColor];
    gistLabel.text = friendInfo[@"gist"];
    gistLabel.textAlignment = NSTextAlignmentCenter;
    gistLabel.font = [UIFont systemFontOfSize:10];
    gistLabel.textColor = [UIColor darkGrayColor];
    gistLabel.layer.cornerRadius = 10;
    gistLabel.layer.masksToBounds = YES;
    
    followersLabel.layer.cornerRadius = 10;
    followersLabel.layer.masksToBounds = YES;
    followersLabel.text = friendInfo[@"Followers"];
    followersLabel.textAlignment = NSTextAlignmentCenter;
    followersLabel.font = [UIFont systemFontOfSize:12];
    
    followerText.font = [UIFont systemFontOfSize:12];
    
    neutralImage.layer.cornerRadius = 10;
    neutralImage.layer.masksToBounds = YES;
    
   
  
    
    int num = [friendInfo[@"followers"] intValue] - [friendInfo[@"following"] intValue];
    
    NSLog(@"num = %@",friendInfo);

    
    if (num > 0)
    {
        followersLabel.layer.borderColor = [[UIColor colorWithRed:0.396f green:0.839f blue:0.686f alpha:1.0f]CGColor];
        followersLabel.layer.borderWidth = 1;
        followersLabel.textColor = [UIColor colorWithRed:0.396f green:0.839f blue:0.686f alpha:1.0f];
        
        followerText.text = @"Leader";
        followerText.textColor = [UIColor colorWithRed:0.396f green:0.839f blue:0.686f alpha:1.0f];
        
        UIImage *upArrowImage = [UIImage imageNamed:@"upArrow"];
        ArrowImageView.image = upArrowImage;
        
        
        
    } else if (num < 0)
    {
        followersLabel.layer.borderColor= [[UIColor colorWithRed:0.839f green:0.031f blue:0.310f alpha:1.0f]CGColor];
        followersLabel.layer.borderWidth = 1;
        followersLabel.textColor = [UIColor colorWithRed:0.839f green:0.031f blue:0.310f alpha:1.0f];
        
        followerText.text = @"Follower";
        followerText.textColor = [UIColor colorWithRed:0.839f green:0.031f blue:0.310f alpha:1.0f];
        
        UIImage *downArrowImage = [UIImage imageNamed:@"downArrow"];
        ArrowImageView.image = downArrowImage;
    } else if (num == 0)
    {
        followersLabel.layer.borderColor = [[UIColor grayColor]CGColor];
        followersLabel.layer.borderWidth = 1;
        followersLabel.textColor = [UIColor grayColor];
        
        neutralImage.backgroundColor = [UIColor grayColor];
        
        followerText.text = @"Just Friends";
        followerText.textColor = [UIColor grayColor];
        
        
    }
    

    
    
   /* friendFollowers.text = friendInfo[@"Followers"];
    friendFollowers.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:10];
    
    friendFollowing.text = friendInfo[@"Following"];
    friendFollowing.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:10];
    [profileButton addTarget:self action:@selector(profileButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    profileButton.backgroundColor = [UIColor darkGrayColor];
    profileButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    profileButton.titleLabel.font = [UIFont systemFontOfSize:10];
    profileButton.layer.cornerRadius = 10;
    [profileButton setTitle:@"PROFILE" forState:UIControlStateNormal];

    
    */
    
  
    
    [gistsButton addTarget:self action:@selector(gistsButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    gistsButton.backgroundColor = [UIColor darkGrayColor];
    gistsButton.layer.borderWidth = 1;
    gistsButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    gistsButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [gistsButton setTitle:@"GISTS" forState:UIControlStateNormal];
    gistsButton.layer.cornerRadius = 10;
    
  

}

- (void)profileButtonWasClicked{
    NSLog(@"Profile button was clicked");
    GFAViewController *profileView = [[GFAViewController alloc]init];
    [self.NavigationController pushViewController:profileView animated:YES];
    profileView.friendInfo2 = self.friendInfo;
    profileView.view.backgroundColor = [UIColor lightGrayColor];
    
    
    
    
}

- (void)gistsButtonWasClicked{
    NSLog(@"Gists button was clicked");
    GFAViewController *profileView = [[GFAViewController alloc]init];
    
    NSString *gistURL = [NSString stringWithFormat:@"https://gist.github.com/%@",self.friendInfo[@"login"]];
    profileView.view.backgroundColor = [UIColor lightGrayColor];
    profileView.friendInfo2 = @{@"html_url": gistURL};
    [self.NavigationController pushViewController:profileView animated:YES];

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
