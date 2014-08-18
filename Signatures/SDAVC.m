//
//  SDAVC.m
//  Signatures
//
//  Created by KaL on 8/13/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "SDAVC.h"
#import "SDADrawView.h"

@interface SDAVC ()

@end

@implementation SDAVC
{
    UIButton *buttons;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor whiteColor];

        UIImageView *bracketpic = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 165)];
        bracketpic.image = [UIImage imageNamed:@"brackets"];
        [self.view addSubview:bracketpic];
        
        SDADrawView *drawView = [[SDADrawView alloc]initWithFrame:CGRectMake(30, 15, 250, 95)];
        [self.view addSubview:drawView];
        
        UIView *scribblebar = [[UIView alloc]initWithFrame:CGRectMake(30, 90, SCREEN_WIDTH - 70, 1)];
        scribblebar.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:scribblebar];
        
        
        int colCount = 2;
        int spacing = 10;
        
        for (int col = 0; col < colCount; col++)
        {
            int x = (spacing + 100) * col;
            
//            buttons = [[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height - 40,100,40)];
//            buttons = [[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height - 400,140,40)];
            buttons = [[UIButton alloc]initWithFrame:CGRectMake(50 + x, self.view.frame.size.height - 360,100,30)];
            [buttons setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            buttons.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:16];
            buttons.layer.cornerRadius = 15;
            [self.view addSubview:buttons];
            
            switch (col) {
                case 0:
                    buttons.backgroundColor = [UIColor colorWithRed:0.000f green:0.937f blue:0.541f alpha:1.0f];
                    [buttons addTarget:self action:@selector(saveButton:) forControlEvents:UIControlEventTouchUpInside];
                    [buttons setTitle:@"SAVE" forState:UIControlStateNormal];
                    break;
                    
                default:
                    buttons.backgroundColor = [UIColor redColor];
                    [buttons addTarget:self action:@selector(clearButton) forControlEvents:UIControlEventTouchUpInside];
                    [buttons setTitle:@"CLEAR" forState:UIControlStateNormal];
                    break;
            }
            

        }
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
}

- (void)saveButton:(UIButton *)button
{
    NSLog(@"save button was pressed");
}

- (void)clearButton
{
    NSLog(@"clear button was pressed");
}
@end
