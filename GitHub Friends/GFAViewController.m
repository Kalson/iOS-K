//
//  GFAViewController.m
//  GitHub Friends
//
//  Created by KaL on 7/25/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "GFAViewController.h"

@interface GFAViewController ()

@end

@implementation GFAViewController
{
    UIWebView *webView;
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
    
    webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    
    
 
}

- (void)setFriendInfo2:(NSDictionary *)friendInfo2
{
    _friendInfo2 = friendInfo2;
    
    NSURL *url = [NSURL URLWithString:friendInfo2[@"html_url"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    
    
    

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
