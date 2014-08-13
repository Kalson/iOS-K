//
//  TLANewTweetVC.m
//  Tweet Like
//
//  Created by KaL on 8/11/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "TLANewTweetVC.h"

@interface TLANewTweetVC ()<UITextViewDelegate>

@end

@implementation TLANewTweetVC
{
    CGPoint location;
}

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
    
    self.tweetTextView.layer.cornerRadius = 10;
    [self.tweetTextView becomeFirstResponder];
    self.tweetTextView.delegate = self;
    
    self.greenView.layer.cornerRadius = 90;
    self.redView.layer.cornerRadius = 90;
    
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

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
        // \n is the return key
    {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (BOOL)isPoint:(CGPoint)point withInRadius:(int)radius ofPoint:(CGPoint)center
{
    CGFloat dx = center.x - point.x;
    CGFloat dy = center.y - point.y;
    CGFloat distance = sqrt(dx * dx * dy * dy);
    return (distance < radius);
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches]anyObject];
    location = [touch locationInView:self.view];
    
    self.saveTweet.center = location;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}

//- (IBAction)saveTweet:(id)sender {
//    [self.tweets addObject:[@{
//                              @"hearts": @0,
//                              @"text": self.tweetTextView.text
//                              }mutableCopy]];
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//    // create outlet to put a corner radius on the button
//    NSLog(@"button was pressed");
//}
- (IBAction)saveButton:(id)sender
{
    [self.tweets addObject:[@{
                                @"hearts": @0,
                                 @"text": self.tweetTextView.text
                                  }mutableCopy]];
    
       [self dismissViewControllerAnimated:YES completion:nil];
        // create outlet to put a corner radius on the button
       NSLog(@"button was pressed");
}
@end
