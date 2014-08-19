//
//  GRAGithubRequest.h
//  Github Request
//
//  Created by KaL on 7/28/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRAGithubRequest : NSObject


// use a class method just to request info, an instance method is for saving that data
+ (NSDictionary *)requestUserInfo:(NSString *)userName;

+ (void)saveUsers:(NSArray *)users;

+ (NSArray *)loadUsers;


@end
