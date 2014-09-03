//
//  DAViewController.m
//  MyData ObjC
//
//  Created by KaL on 9/2/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "DAViewController.h"
#import "AppDelegate.h"


@interface DAViewController ()

@end

@implementation DAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *appD = [AppDelegate new];
    
    // creates the fetch
    NSFetchRequest *fetchrequest = [[NSFetchRequest alloc] init];
    
    // describes the entitiy
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:appD.managedObjectContext];
    
    // makes fetch request look for entity
    [fetchrequest setEntity:entity];
    
    
    // filters which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user",@"jo@theironyard.com"];
    
    // makes fetch request look for predicate
    [fetchrequest setPredicate:predicate];
    
    NSLog(@"fetch: %@",fetchrequest);
    

//
//NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//NSEntityDescription *entity = [NSEntityDescription entityForName:@"<#Entity name#>" inManagedObjectContext:<#context#>];
//[fetchRequest setEntity:entity];
//// Specify criteria for filtering which objects to fetch
//NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
//[fetchRequest setPredicate:predicate];
//// Specify how the fetched objects should be sorted
//NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"<#key#>"
//ascending:YES];
//[fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
//
//NSError *error = nil;
//NSArray *fetchedObjects = [<#context#> executeFetchRequest:fetchRequest error:&error];
//if (fetchedObjects == nil) {
//    <#Error handling code#>
//}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
