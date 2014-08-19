//
//  MSARequest.h
//  Mayorships
//
//  Created by KaL on 8/19/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@interface MSARequest : NSObject

+ (NSArray *)findMayorshipsWithLocation:(CLLocation *)location;
+ (NSArray *)findVenuesWithLocation:(CLLocation *)location;


@end
