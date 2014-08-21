//
//  MFCViewController.m
//  My Face is Cool
//
//  Created by KaL on 8/20/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "MFCViewController.h"

@interface MFCViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation MFCViewController
{
    UIImagePickerController *imagePicker;
    UIImage *image;
    NSString *video;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = NO;
        imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:imagePicker.sourceType];
        imagePicker.videoMaximumDuration = 10;
        
        image = [[UIImage alloc]init];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *camera = [[UIButton alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 60, 130, 40)];
    [camera setTitle:@"camera" forState:UIControlStateNormal];
    [camera setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [camera addTarget:self action:@selector(cameraButton) forControlEvents:UIControlEventTouchUpInside];
    camera.layer.cornerRadius = 10;
    camera.layer.borderWidth = 1;
    camera.layer.borderColor = [[UIColor greenColor]CGColor];
    [self.view addSubview:camera];
    
    UIButton *photos = [[UIButton alloc]initWithFrame:CGRectMake(170, SCREEN_HEIGHT - 60, 130, 40)];
    [photos setTitle:@"photos" forState:UIControlStateNormal];
    [photos setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [photos addTarget:self action:@selector(photoButton) forControlEvents:UIControlEventTouchUpInside];
    photos.layer.cornerRadius = 10;
    photos.layer.borderWidth = 1;
    photos.layer.borderColor = [[UIColor redColor]CGColor];
    [self.view addSubview:photos];
    
//    UIView *imageView = [[UIView alloc]initWithFrame:CGRectMake(20, 120,280,280)];
//    imageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageView];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // saves the photo in a imageView
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(20, 120,280,280);
    [self.view addSubview:imageView];
    
    // saves the photo to the photo album
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    
    if (video)
    {
         video = [info objectForKey:UIImagePickerControllerMediaURL];
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(video))
        {
           UISaveVideoAtPathToSavedPhotosAlbum(video, nil, nil, nil);
        }
    }
   
    [self dismissViewControllerAnimated:imagePicker completion:nil];
}

- (void)cameraButton
{
    [self presentViewController:imagePicker animated:YES completion:nil];
 imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
}

- (void)photoButton
{
    [self presentViewController:imagePicker animated:YES completion:nil];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
}

@end
