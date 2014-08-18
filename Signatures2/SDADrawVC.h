//
//  SDADrawVC.h
//  Signatures2
//
//  Created by KaL on 8/14/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDADrawView;

@interface SDADrawVC : UIViewController

@property (nonatomic) SDADrawView *drawView;

- (void)clearSignature;
- (UIImage *)getSignature;

@end
