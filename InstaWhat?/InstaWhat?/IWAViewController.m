//
//  IWAViewController.m
//  InstaWhat?
//
//  Created by KaL on 8/21/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "IWAViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface IWAViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation IWAViewController
{
    UIImagePickerController *imagepicker;
    NSMutableArray *photos;
    ALAssetsLibrary *library;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    photos = [@[]mutableCopy];
    
    
    imagepicker = [[UIImagePickerController alloc]init];
    imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagepicker.view.frame = CGRectMake(0, 0, 320, 320);
    imagepicker.showsCameraControls = NO;
    imagepicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    imagepicker.delegate = self;
    // to start camera when launch add to subview
    [self.view addSubview:imagepicker.view];
    [self addChildViewController:imagepicker];
    
    
    UIButton *takePictureButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 370, 100, 100)];
    takePictureButton.backgroundColor = [UIColor blackColor];
    [takePictureButton addTarget:self action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:takePictureButton];
    
    // take picture w/o a button
//    dispatch_after(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_MSEC)),dispatch_get_main_queue() ^{
//        [imagepicker takePictureButton];
//    });
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(100, 100);
    
    UICollectionView *photoCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height - 320) collectionViewLayout:layout];
    
    [photoCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    photoCollection.dataSource = self;
    photoCollection.delegate = self;
    
    [self.view addSubview:photoCollection];
    
    library = [[ALAssetsLibrary alloc]init];
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            NSLog(@"type %@",[result valueForProperty:ALAssetPropertyType]);
            
            // you can't add nil into the array so you test w/ a if statement
            if (result) [photos addObject:result];
            
            // after each assets run
            
            [photoCollection reloadData];
            
        }];
        
    } failureBlock:^(NSError *error) {
        
    }];
    

}

// ALAssetsLibrary class reference - some camera stuff

- (void)takePicture
{
    [imagepicker takePicture];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ALAsset *photo = photos[indexPath.item];
    // because we added ALAsset *object to the array
    
    UIImageView *thumbnailView = [[UIImageView alloc]initWithFrame:cell.bounds];
    thumbnailView.image = [UIImage imageWithCGImage:photo.thumbnail];
    
    [cell.contentView addSubview:thumbnailView];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImageView *bigView = [[UIImageView alloc]initWithFrame:imagepicker.view.frame];
    ALAsset *photo = photos[indexPath.item];
    
    ALAssetRepresentation *representation = photo.defaultRepresentation;
    
    bigView.image = [UIImage imageWithCGImage:representation.fullResolutionImage];
    
    [self.view addSubview:bigView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return photos.count;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = info[UIImagePickerControllerOriginalImage];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
