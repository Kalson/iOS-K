//
//  SDADrawVC.m
//  Signatures2
//
//  Created by KaL on 8/14/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SDADrawVC.h"
#import "SDADrawView.h"

@interface SDADrawVC ()

@end

@implementation SDADrawVC

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
    
    
    self.drawView = [[SDADrawView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.view addSubview:self.drawView];
}

- (void)clearSignature
{
    [self.drawView.scribbles removeAllObjects];
    [self.drawView setNeedsDisplay];
}

- (UIImage *)getSignature
{
    UIImage *image = self.drawView.scribblesImage;
    [self clearSignature];
    return image;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self.drawView];
    
    // turning cgpoint into a nsvalue
    NSValue *pointValue = [NSValue valueWithCGPoint:location];
    
    // creating the current scribble with a mutable array w/ point value adding to it
    self.drawView.currentScribble = [@[pointValue]mutableCopy];
    
    // addding the new current scribble to the arrays of scribble
    [self.drawView.scribbles addObject:self.drawView.currentScribble];
    
    [self.drawView setNeedsDisplay];
    
    NSLog(@"touches began");
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.drawView];
    
    NSValue * pointValue = [NSValue valueWithCGPoint:location];
    //getting every new point value and adding to array
    [self.drawView.currentScribble addObject:pointValue];
     [self.drawView setNeedsDisplay];
    
    NSLog(@"touching root");

}

@end
