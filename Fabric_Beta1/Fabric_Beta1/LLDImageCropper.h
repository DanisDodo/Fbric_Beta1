//
//  LLDImageCropperViewController.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-16.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LLDImageCropperDelegate;

@interface LLDImageCropper : UIViewController
<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIImageView *imageView;
    
    id<LLDImageCropperDelegate> delegate;
}
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@property (strong, nonatomic) id<LLDImageCropperDelegate> delegate;

-(id)initWithImage:(UIImage *)image;

@end

@protocol LLDImageCropperDelegate <NSObject>

-(void)imageCropper:(LLDImageCropper *)cropper didFinishCroppingWithImage:(UIImage *)image;
-(void)imageCropperDidCancel:(LLDImageCropper *)cropper;

@end