//
//  MSAFirstViewController.m
//  Mayorships
//
//  Created by KaL on 8/19/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MSAFirstViewController.h"

#import "MSARequest.h"

#import <CoreLocation/CoreLocation.h>

@interface MSAFirstViewController () <UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>

// tableview controller is a delegate and the data source for a tableview

@end

@implementation MSAFirstViewController
{
    NSArray *mayorships;
 
    CLLocationManager *locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.mayorList.dataSource = self;
    self.mayorList.delegate = self;
    
    self.mayorList.rowHeight = 50;
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
        
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations[0];
     [locationManager stopUpdatingLocation];
    
//    mayorships = [MSARequest findMayorshipsWithLocation:location];
    
    [MSARequest findMayorshipsWithLocation:location completion:^(NSArray * mayors)
    {
        // get the block ready and holding for later use
        // to call after its ran somewhere
        // run when the method chooses to uses it
        mayorships = mayors;
        [self.mayorList reloadData];
        
        
    }];
    
    
   

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mayorships.count;
}
    

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.mayorList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *mayor = mayorships[indexPath.row];
    
    NSString *photoURL = [NSString stringWithFormat:@"%@100x100%@",mayor[@"user"][@"photo"][@"prefix"],mayor[@"user"][@"photo"][@"suffix"]];
    NSURL *url = [NSURL URLWithString:photoURL];
    
    NSString *documentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",mayor[@"user"][@"id"]]];
    
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    if (!fileExist)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            // setting the image to table view
            
            // datawithcontents makes the request
            NSData *data = [NSData dataWithContentsOfURL:url];
            // save the files
            [data writeToFile:filePath atomically:YES];
            
            NSLog(@"file request: %@",photoURL);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imageView.image = [UIImage imageWithData:data];
            });
            
            
            // create a UIView if you want to postition the images within the tableview cell
            
            // can't put a UI Stuff on a side thread (dispatch_async)
        });
    } else {
        
        cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];

    }
    
    cell.textLabel.text = mayor[@"user"][@"firstName"];
    
  return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
