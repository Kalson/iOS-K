//
//  IWAFilterViewController.m
//  InstaWhat?
//
//  Created by KaL on 8/25/14.
//  Copyright (c) 2014 Kalson Kalu. All rights reserved.
//

#import "IWAFilterViewController.h"
#import "IWASaveFilterController.h"

#import <AssetsLibrary/AssetsLibrary.h>


@interface IWAFilterViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate>

@end

@implementation IWAFilterViewController
{
    UIImageView *imageView;
    UICollectionView *filterCollection;
    NSArray *filters;
    ALAssetsLibrary *library;
    
    UIImage *filterImage;
//    NSMutableArray *filterArray;
    NSMutableDictionary *filterDictionary;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        filters = @[
//                    @"CIColorCrossPolynomial",
//                    @"CIColorCube",
//                    @"CIColorCubeWithColorSpace",
                    @"CIColorInvert",
//                    @"CIColorMap",
                    @"CIColorMonochrome",
//                    @"CIColorPosterize",
//                    @"CIFalseColor",
//                    @"CIMaskToAlpha",
//                    @"CIMaximumComponent",
//                    @"CIMinimumComponent",
//                    @"CIPhotoEffectChrome",
//                    @"CIPhotoEffectFade",
//                    @"CIPhotoEffectInstant",
//                    @"CIPhotoEffectMono",
//                    @"CIPhotoEffectNoir",
//                    @"CIPhotoEffectProcess",
//                    @"CIPhotoEffectTonal",
//                    @"CIPhotoEffectTransfer",
                    @"CISepiaTone",
                    @"CIVignette",
                    @"CIVignetteEffect",
                    ];
        
//        filterArray = [@[]mutableCopy];
        filterDictionary = [@{}mutableCopy];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:imageView];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 100);
        
        filterCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height - 320) collectionViewLayout:layout];
        filterCollection.dataSource = self;
        filterCollection.delegate = self;
        [self.view addSubview:filterCollection];
        
        [filterCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

        
    }
    return self;
}

- (void)setOrigialImage:(UIImage *)origialImage
{
    _origialImage = origialImage;
    
    imageView.image = origialImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return filters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *filterName = filters[indexPath.item];
    UIImageView *filterView = [[UIImageView alloc]initWithFrame:cell.bounds];

    [cell addSubview:filterView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // gets a second thread/queue for the request
        filterImage = [self filterImageWithFilterName:filterName];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
//            if (filterImage)
//            {
                filterView.image = filterImage;
            
            // add the filter image to an array or dictionary to get the filters to work
//                [filterArray addObject:filterImage];
            
            // use a dictionary because if u use an array, when 5 indexes are being run, index:4 might finish
            // before indes:0 cause the objects in the array not to run in the right order
            
//            [filterDictionary setObject:filterImage forKey:[NSString stringWithFormat:@"%ld",(long)indexPath.item]];
            [filterDictionary setObject:filterImage forKey:[NSString stringWithFormat:@"%d",(int)indexPath.item]];
//            }
            
            
        });
    });
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *filter = filters[indexPath.item];
//    ALAssetRepresentation *representation = filter.defaultRepresentation;
//    
//    // push vcontroller
    [self savePhotoWithImage:filterDictionary[[NSString stringWithFormat:@"%d",(int)indexPath.item]]];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // push vcontroller
    [self savePhotoWithImage:info[UIImagePickerControllerEditedImage]];
}

- (UIImage *)filterImageWithFilterName:(NSString *)filterName
{
    // turn uiimage to a ciimage
    CIImage *ciImage = [CIImage imageWithCGImage:self.origialImage.CGImage];
    
    // create cifilterf with filterName
    CIFilter *filter = [CIFilter filterWithName:filterName];
    
    // add ciimage to the filter
    [filter setValue:ciImage forKey:kCIInputImageKey];
    
    // get filtered image from filter
    CIImage *ciREsult = [filter outputImage];
    
    // setup context to turn ciimage into cgimage
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    
    // init uiimage with cgimage
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciREsult fromRect:[ciREsult extent]]];

}

- (void)savePhotoWithImage:(UIImage *)image
{
    IWASaveFilterController *saveFIlterVC = [[IWASaveFilterController alloc]init];
    
    // pass the property "filteredImage" to the image
    saveFIlterVC.filteredImage = image;
    [self.navigationController pushViewController:saveFIlterVC animated:YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
