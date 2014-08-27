//
//  IWASaveFilterController.m
//  InstaWhat?
//
//  Created by KaL on 8/25/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "IWASaveFilterController.h"

#import <Parse/Parse.h>

@interface IWASaveFilterController ()<UITextViewDelegate>

@end

@implementation IWASaveFilterController
{
    UIImageView *imageView;
    UIView *captionHolder;
    UITextView *captionView;
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
        
       
//        [self.view addSubview:textView];
        
        captionHolder = [[UIView alloc]initWithFrame:CGRectMake(0, 310, 320,[UIScreen mainScreen].bounds.size.height - 310 )];
        captionHolder.backgroundColor = [UIColor lightGrayColor];
        captionHolder.layer.borderWidth = 10;
        captionHolder.layer.borderColor = [[UIColor whiteColor]CGColor];
        [self.view addSubview:captionHolder];
        
        captionView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, 280, captionHolder.frame.size.height - 70)];
        captionView.delegate = self;
        [captionHolder addSubview:captionView];
        
        UIButton *submitButton = [[UIButton alloc]initWithFrame:CGRectMake(20, captionHolder.frame.size.height - 60, 280, 40)];
        submitButton.backgroundColor = [UIColor orangeColor];
        [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont systemFontOfSize:25];
        [submitButton addTarget:self action:@selector(saveFace) forControlEvents:UIControlEventTouchUpInside];
        [captionHolder addSubview:submitButton];
    }
    return self;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    // moves the textView Up
    [UIView animateWithDuration:0.2 animations:^{
        captionHolder.center = CGPointMake(captionHolder.center.x, captionHolder.center.y - 216);
        
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)saveFace
{
    PFObject *face = [PFObject objectWithClassName:@"Faces"];
    [face setObject:captionView.text forKey:@"text"];
    
    NSData *data = UIImagePNGRepresentation(imageView.image);
    
    PFFile *file = [PFFile fileWithData:data];
    [face setObject:file forKey:@"image"];
    [face saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:@"faceSaved" object:nil];
    }];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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

@end
