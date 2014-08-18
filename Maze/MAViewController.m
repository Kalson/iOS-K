//
//  MAViewController.m
//  Maze
//
//  Created by KaL on 8/14/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MAViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface MAViewController () <UICollisionBehaviorDelegate, UIAlertViewDelegate>

@end

@implementation MAViewController
{
    float xRotation;
    float yRotation;
    
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravityBehavior;
    UICollisionBehavior *collisionBehavior;
    UIDynamicItemBehavior *wallBehavior;
    
    CMMotionManager *motionManager;
    
    UIView *ball;
    UIView *finishPoint;
    UIButton *startButton;
    UIView *wall;
    UIView *wall2;
    UIView *wall3;
    
    NSMutableArray * blackHoles;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor lightGrayColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    blackHoles = [@[] mutableCopy];
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    gravityBehavior = [[UIGravityBehavior alloc]init];
    [animator addBehavior:gravityBehavior];
    
    collisionBehavior = [[UICollisionBehavior alloc]init];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;
    [animator addBehavior:collisionBehavior];
    
    wallBehavior = [[UIDynamicItemBehavior alloc]init];
    wallBehavior.density = 1000000000;
    [animator addBehavior:wallBehavior];
    
    // sets the screen size
    self.view.frame =  CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);

    
    [self startButton];

  
    motionManager = [[CMMotionManager alloc]init];
    
    [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
//        NSLog(@"x %f y %f z %f",motion.rotationRate.x,motion.rotationRate.y,motion.rotationRate.z);
        
        xRotation += motion.rotationRate.x/20;
        yRotation += motion.rotationRate.y/20;
        
        [self updateGravity];
    
    }];
    

}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    NSLog(@"%@",item1);
    
    NSLog(@"%@",item2);
    
    for (UIView * blackhole in blackHoles)
    {
        
        
        if ([item1 isEqual:blackhole] || [item2 isEqual:blackhole])
        {
            [collisionBehavior removeItem:ball];
            [ball removeFromSuperview];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"You fell in the blackhole" delegate:self cancelButtonTitle:@"Try Again?" otherButtonTitles:nil];
            [alert show];
            
            [wall removeFromSuperview];
            [wall2 removeFromSuperview];
            [wall3 removeFromSuperview];
            [collisionBehavior removeItem:wall];
            [collisionBehavior removeItem:wall2];
            [collisionBehavior removeItem:wall3];
            [finishPoint removeFromSuperview];
            [collisionBehavior removeItem:finishPoint];
            
//            [blackhole removeFromSuperview];
        
            // run method to clear blackholes
          
            NSLog(@"boom");
        }
        
//        [collisionBehavior removeItem:blackhole];
  
       
    }
    
    if ([item1 isEqual:finishPoint] || [item2 isEqual:finishPoint])
    {
        [collisionBehavior removeItem:ball];
        [ball removeFromSuperview];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"YAY!" message:@"You Won!" delegate:self cancelButtonTitle:@"You wanna play again?" otherButtonTitles:nil];
        
        [alert show];
        NSLog(@"boom2");
        
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    ball = nil;
    if (ball == nil)
    {
        [self startButton];
        
        // blackhole removal
        for (UIView *blackhole in blackHoles)
        {
            [blackhole removeFromSuperview];
            [collisionBehavior removeItem:blackhole];
            [wallBehavior removeItem:blackhole];
            
        }
        
    }
}

- (void)createBlackHoles
{
    // blackhole removal
    for (UIView *blackhole in blackHoles)
    {
        [blackhole removeFromSuperview];
        [collisionBehavior removeItem:blackhole];
        [wallBehavior removeItem:blackhole];
        
    }
    int rowCount = 5;
    
    for (int row = 0; row < rowCount ; row++) {
        int y = (42) * row;
        
        UIView * blackhole = [[UIView alloc]initWithFrame:CGRectMake(190, 110 + y, 40, 40)];
        blackhole.backgroundColor = [UIColor blackColor];
        blackhole.layer.cornerRadius = 20;
        [self.view addSubview:blackhole];
        
        [blackHoles addObject:blackhole];
        
        [wallBehavior addItem:blackhole];
        [collisionBehavior addItem:blackhole];
    }
    
    int colCount = 3;
    
    for (int col = 0; col < colCount ; col++) {
        int x = (42) * col;
        
        UIView * blackhole = [[UIView alloc]initWithFrame:CGRectMake(x + 365, 220, 40, 40)];
        blackhole.backgroundColor = [UIColor blackColor];
        blackhole.layer.cornerRadius = 20;
        [self.view addSubview:blackhole];
        
        
        
        [blackHoles addObject:blackhole];
        
        [wallBehavior addItem:blackhole];
        [collisionBehavior addItem:blackhole];
        
    }
}

- (void)startGame
{
    // remove all walls, blackholes, finishpoint, etc
    
    [self createBall];
    [self createWalls];
    [self createFinishPoint];
    [self createBlackHoles];
    
    [startButton removeFromSuperview];
}

- (void)startButton
{
    startButton = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 150)/2, 80, 150, 150)];
    startButton.backgroundColor = [UIColor darkGrayColor];
    startButton.layer.cornerRadius = 75;
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
    startButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:startButton];
}

- (void)createWalls
{
    wall = [[UIView alloc]initWithFrame:CGRectMake(60, 0, 60, 260)];
    wall.backgroundColor = [UIColor darkGrayColor];
    wall.layer.cornerRadius = 10;
    [self.view addSubview:wall];
    [wallBehavior addItem:wall];
    [collisionBehavior addItem:wall];
    
    wall2 = [[UIView alloc]initWithFrame:CGRectMake(300, 0, 60, 260)];
    wall2.backgroundColor = [UIColor darkGrayColor];
    wall2.layer.cornerRadius = 10;
    [self.view addSubview:wall2];
    [wallBehavior addItem:wall2];
    [collisionBehavior addItem:wall2];
    
    wall3 = [[UIView alloc]initWithFrame:CGRectMake(450, 80, 140, 60)];
    wall3.backgroundColor = [UIColor darkGrayColor];
    wall3.layer.cornerRadius = 10;
    [self.view addSubview:wall3];
    [wallBehavior addItem:wall3];
    [collisionBehavior addItem:wall3];
}

- (void)createFinishPoint
{
    finishPoint = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 20, 40, 40)];
    finishPoint.backgroundColor = [UIColor colorWithRed:0.000f green:1.000f blue:0.655f alpha:1.0f];
    finishPoint.layer.cornerRadius = 20;
    [self.view addSubview:finishPoint];
    
    [collisionBehavior addItem:finishPoint];
    [wallBehavior addItem:finishPoint];
}


- (void)createBall
{
    ball = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    ball.backgroundColor = [UIColor greenColor];
    // sets the ball in the center of the screen
    ball.center = CGPointMake(10, 20);
    ball.layer.cornerRadius = 20;
    [self.view addSubview:ball];
    [gravityBehavior addItem:ball];
    [collisionBehavior addItem:ball];
}

- (void)updateGravity
{
    gravityBehavior.gravityDirection = CGVectorMake(xRotation,yRotation);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    xRotation = yRotation = 0;
       [self updateGravity];
}

- (BOOL)prefersStatusBarHidden{return YES;}

@end
