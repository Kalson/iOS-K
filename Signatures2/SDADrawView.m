//
//  SDADrawView.m
//  Signatures2
//
//  Created by KaL on 8/14/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SDADrawView.h"

@implementation SDADrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.scribbles = [@[]mutableCopy];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    NSLog(@"touch");
    
    // need an array for each scribble point
    // scribble is an array and each scribble is an array
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor colorWithWhite:0.1 alpha:1.0]set];
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    for (NSMutableArray *scribble in self.scribbles)
    {
        CGPoint start = [scribble[0] CGPointValue];
        // must move to point before add line point
        CGContextMoveToPoint(context, start.x, start.y);
        
        for (NSValue *value in scribble)
        {
            CGPoint point = [value CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
    }
    CGContextStrokePath(context);
    if (self.scribbles.count > 0) {
          // but we need the drawing before we save the image
        [self saveImgageWithContext:context];
    } else
        self.scribblesImage = nil;
    
    CGContextMoveToPoint(context, 20.0, 50.0);
    CGContextAddLineToPoint(context, 20.0, 20.0);
    CGContextAddLineToPoint(context, 50.0, 20.0);

    CGContextMoveToPoint(context, SCREEN_WIDTH-20.0, 50.0);
    CGContextAddLineToPoint(context, SCREEN_WIDTH-20.0, 20);
    CGContextAddLineToPoint(context, SCREEN_WIDTH-50.0, 20.0);
    
    CGContextMoveToPoint(context, 20.0, 100.0);
    CGContextAddLineToPoint(context, 20, 130);
    CGContextAddLineToPoint(context, 50.0, 130.0);
    
    CGContextMoveToPoint(context, SCREEN_WIDTH-20.0, 100.0);
    CGContextAddLineToPoint(context, SCREEN_WIDTH-20.0, 130);
    CGContextAddLineToPoint(context, SCREEN_WIDTH-50.0, 130.0);
    
    CGContextMoveToPoint(context, 40.0, 110.0);
    CGContextAddLineToPoint(context, SCREEN_WIDTH-40.0, 110);
    
  
    CGContextStrokePath(context);
}

- (void)saveImgageWithContext:(CGContextRef)context
{
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    
    self.scribblesImage = [UIImage imageWithCGImage:imgRef];
    
    NSLog(@"%f",self.scribblesImage.size.height);
    CGImageRelease(imgRef);
//    CGContextRelease(context);
}

@end
