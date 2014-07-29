//
//  GRAGithubRequest.h
//  Github Request
//
//  Created by KaL on 7/28/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRAGithubRequest : NSObject

+ (NSDictionary *)requestUserInfo:(NSString *)userName;

@end
