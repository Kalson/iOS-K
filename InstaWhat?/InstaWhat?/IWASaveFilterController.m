//
//  IWASaveFilterController.m
//  InstaWhat?
//
//  Created by KaL on 8/25/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "IWASaveFilterController.h"

@interface IWASaveFilterController ()

@end

@implementation IWASaveFilterController
{
    UIImageView *imageView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
//        imageView.backgroundColor = [UIColor redColor];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:imageView];
        
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height - 320)];
        [self.view addSubview:textView];
        
    }
    return self;
}

- (void)setFilteredImage:(UIImage *)filteredImage
{
    _filteredImage = filteredImage;
    
    imageView.image = filteredImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
