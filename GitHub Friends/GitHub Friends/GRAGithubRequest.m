//
//  GRAGithubRequest.m
//  Github Request
//
//  Created by KaL on 7/28/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "GRAGithubRequest.h"

@implementation GRAGithubRequest

+ (NSDictionary *)requestUserInfo:(NSString *)userName
{
    // take the username and call the github url
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@?access_token=cdad0cf27506be89a9c06be02bb47e198d6e7740",userName];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //  mutable request
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
    [mutableRequest setHTTPMethod:@"POST"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *responseData =  [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
//    NSLog(@"userInfo = %@",userInfo);
    
    return userInfo;
}

+ (void)saveUsers:(NSArray *)users
{
    // path to what we are saving
    NSString *path = [GRAGithubRequest usersArchivePath];
    
    // then we archive
    NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:users];
    
    // then we save file
    [userData writeToFile:path options:NSDataWritingAtomic error:nil];
}

+ (NSArray *)loadUsers
{
    // path to what we are loading
    NSString *path = [GRAGithubRequest usersArchivePath];
    
    //then we unarachive
    NSArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    //then we rerturn the array
    return users;
}

+ (NSString *)usersArchivePath
{
    // returns array of dictories
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // grab first path from above array
    NSString *documentDicectory = documentDirectories[0];
    
    // return path/users.data
    return [documentDicectory stringByAppendingPathComponent:@"users.data"];
}

@end
