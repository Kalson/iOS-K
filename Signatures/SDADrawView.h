//
//  SDADrawView.h
//  Signatures
//
//  Created by KaL on 8/13/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDADrawView : UIView

@property (nonatomic) NSMutableArray *scribbles;
@property (nonatomic) NSMutableDictionary *currentscribble;

@property (nonatomic) UIColor *lineColor;
@property (nonatomic) int lineWidth;

@property (nonatomic) BOOL isScribbleMode;

@end
