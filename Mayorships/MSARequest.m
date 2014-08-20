//
//  MSARequest.m
//  Mayorships
//
//  Created by KaL on 8/19/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MSARequest.h"

#define API @"https://api.foursquare.com/v2/"
#define CLIENT_ID @"T2BOWSGDIZL1TD4MUDLH3XI40DAUCMO2YNXYFWQ251NHF0XQ"
#define CLIENT_SECRET @"NNAF45QBWE0FWLI0M4XSHKJPELGYEHNENIIEYRHU4KE5XWCJ"

// venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD
// ll=40.7,-74 need to turn something into this
// v stands for version

// class method is mostly used when you want to retrieve data
// instance method is for saving data that can be modified

@implementation MSARequest

//+ (NSArray *)findMayorshipsWithLocation:(CLLocation *)location
+ (void)findMayorshipsWithLocation:(CLLocation *)location completion:(void (^)(NSArray * mayors))completion
{
    
//    NSArray *venues = [MSARequest findVenuesWithLocation:location];
    [MSARequest findVenuesWithLocation:location completion:^(NSArray *venues)
    {
        NSMutableArray *mayors = [@[]mutableCopy];
        
        for (NSDictionary *venue in venues) {
            NSString *endpoint = [NSString stringWithFormat:@"venues/%@",venue[@"id"]];
            
            //        NSDictionary *venueInfo = [MSARequest foursquareRequestWithEndpoints:endpoint andParameters:@{}];
            
            [MSARequest foursquareRequestWithEndpoints:endpoint andParameters:@{} completion:^(NSDictionary *responseInfo)
             {
                 NSDictionary *mayor = responseInfo[@"response"][@"venue"][@"mayor"];
                 
                if(mayor) [mayors addObject:mayor];
                 
                  if (completion) completion(mayors);
                 
             }];
            
        }
        
        //    return mayors;

        
    }];
    
   }

+ (void)findVenuesWithLocation:(CLLocation *)location completion:(void(^)(NSArray * venues))completion
{
    NSDictionary *parameters = @{
                                 @"ll": [NSString stringWithFormat:@"%f,%f",location.coordinate.latitude,location.coordinate.longitude]
                                 };
    
    [MSARequest foursquareRequestWithEndpoints:@"venues/search" andParameters:parameters completion:^(NSDictionary *responseInfo) {
        if (completion) completion(responseInfo[@"response"][@"venues"]);
    }];
    
//    return [MSARequest foursquareRequestWithEndpoints:@"venues/search" andParameters:parameters][@"response"][@"venues"];
    
    // no self in a class method
    // self is only use instance method
}



+ (void)foursquareRequestWithEndpoints:(NSString *)endpoint andParameters:(NSDictionary *)parameters completion:(void(^)(NSDictionary * responseInfo))completion
{
    NSMutableString *requestString = [[API stringByAppendingString:endpoint]mutableCopy];
    [requestString appendString:[NSString stringWithFormat:@"?client_id=%@&client_secret=%@&v=20140819",CLIENT_ID,CLIENT_SECRET]];
    
    for (NSString *key in [parameters allKeys])
    {
            [requestString appendFormat:@"&%@=%@",key,[parameters objectForKey:key]];
    }
    
    NSLog(@"%@",requestString);
    
//    NSString *endpointURL = [API stringByAppendingString:endpoint];
    
    NSURL *requestURL = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // need to serilize the data
        NSDictionary *responseInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (completion) completion(responseInfo);
    }];
    
   
//    NSLog(@" response = %@",responseInfo);
    
    // need to turn a dictionary to a string
    
//    return responseInfo;
}
@end
