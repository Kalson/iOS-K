//
//  MCSViewController.m
//  My Cool Spots
//
//  Created by KaL on 8/18/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MCSViewController.h"

#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>

#import "MCSAnnotation.h"

@interface MCSViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@end

@implementation MCSViewController
{
    MKMapView *myMapView;
    
    CLLocationManager * locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    myMapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    myMapView.showsUserLocation = YES;
    myMapView.userTrackingMode = YES;
    myMapView.delegate = self;
    [self.view addSubview:myMapView];
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation *location in locations)
    {
        NSLog(@"%f %f",location.coordinate.latitude, location.coordinate.longitude);
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        
        [myMapView setRegion:region animated:YES];
        
        for (int i = 0; i < 10; i++) {

            MCSAnnotation *annotation = [[MCSAnnotation alloc]init];
//            [annotation setCoordinate:location.coordinate];
            
            float randomLat = (arc4random_uniform(100) - 50.0)/100.0 + location.coordinate.latitude;
            float randomLong = (arc4random_uniform(100) - 50.0)/100.0 + location.coordinate.longitude;
            
            CLLocationCoordinate2D randomCoordinate = CLLocationCoordinate2DMake(randomLat,randomLong);
            
            [annotation setCoordinate:randomCoordinate];
            
            CLGeocoder *geocoder = [[CLGeocoder alloc]init];
            
            CLLocation *randomLocation = [[CLLocation alloc]initWithLatitude:randomCoordinate.latitude longitude:randomCoordinate.longitude];
            
            [geocoder reverseGeocodeLocation:randomLocation completionHandler:^(NSArray *placemarks, NSError *error) {
                
                for (CLPlacemark *placemark in placemarks) {
                    
                    NSLog(@"%@",placemark.addressDictionary);
                    [annotation setTitle:placemark.addressDictionary[@"City"]];
                }

            }];
            
            [annotation setTitle:@"Title"];
            
            [myMapView addAnnotation:annotation];

        }
        
    }
    [locationManager stopUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    MCSAnnotation *ann = annotation;

    if (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
    {
        
    } else {
        MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
        
        NSLog(@"anotationView");
        annotationView.draggable = YES;
        
        NSArray *markers = @[
                             [UIImage imageNamed:@"blue"],
                             [UIImage imageNamed:@"green"],
                             [UIImage imageNamed:@"magenta"]
                             ];
        
        int randonMarker = arc4random_uniform((int)markers.count);

        
        // setting images to the annotation
        annotationView.image = markers[randonMarker];
        
        annotationView.canShowCallout = YES;
        
        
        UIButton *rightCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.rightCalloutAccessoryView = rightCallout;
        [rightCallout addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];
        
        
        return annotationView;
    }
    
    return nil;
}

- (void)showDetailVC
{
    UIViewController *detailVC = [[UIViewController alloc]init];
    detailVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
