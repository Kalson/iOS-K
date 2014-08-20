//
//  MSAData.m
//  Mayorships
//
//  Created by KaL on 8/19/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MSAData.h"

@implementation MSAData

+ (MSAData *)mainData
{
    static dispatch_once_t create;
    static MSAData *singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[MSAData alloc]init];
    });
    return singleton;
}


@end
