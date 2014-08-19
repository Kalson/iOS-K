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
    NSArray *images;
    
    CLLocationManager *locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.mayorList.dataSource = self;
    self.mayorList.delegate = self;
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    self.image = [UIImage imageNamed:<#(NSString *)#>]
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations[0];
     [locationManager stopUpdatingLocation];
    
    mayorships = [MSARequest findMayorshipsWithLocation:location];
    images = [MSARequest findMayorshipsWithLocation:location];
    [self.mayorList reloadData];
   

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mayorships.count;
}
    

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.mayorList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *mayor = mayorships[indexPath.row];
    cell.textLabel.text = mayor[@"user"][@"firstName"];

    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
