//
//  LLDImageCropperViewController.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-16.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDImageCropper.h"
#import <QuartzCore/QuartzCore.h>



/*
 *通过截屏的方式进行确定，这样可以保证最后选取的图片的分辨率和屏幕是相吻合的
 */


@interface LLDImageCropper ()

@end

@implementation LLDImageCropper

@synthesize scrollView, imageView;
@synthesize delegate;

-(id)initWithImage:(UIImage *)image{
    self = [super init];
    if (self) {
        CGSize screen_size = [[UIScreen mainScreen]bounds].size;
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen_size.width, screen_size.height)];
        [scrollView setBackgroundColor:[UIColor blackColor]];
        [scrollView setDelegate:self];
        [scrollView setShowsHorizontalScrollIndicator:NO];
        [scrollView setShowsVerticalScrollIndicator:NO];
        [scrollView setMaximumZoomScale:2.0];
        
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeTopLeft;
        
        CGRect rect;
        rect.size.width = image.size.width;
        rect.size.height = image.size.height;
        
        [imageView setFrame:rect];
        
        [scrollView setContentSize:imageView.frame.size];
        [scrollView setMinimumZoomScale:scrollView.frame.size.width/imageView.frame.size.width];
        [scrollView setZoomScale:scrollView.frame.size.height/imageView.frame.size.height];
        [scrollView addSubview:imageView];
        
        [self.view addSubview:scrollView];
        
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithTitle:@"done" style:UIBarButtonItemStyleBordered target:self action:@selector(finishCropping)];
        self.navigationItem.rightBarButtonItem = doneItem;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)cancelCropping {
	[delegate imageCropperDidCancel:self];
}

- (void)finishCropping {
    //	float zoomScale = 1.0 / [scrollView zoomScale];
    //
    //	CGRect rect;
    //	rect.origin.x = [scrollView contentOffset].x * zoomScale;
    //	rect.origin.y = [scrollView contentOffset].y * zoomScale;
    //	rect.size.width = [scrollView bounds].size.width * zoomScale;
    //	rect.size.height = [scrollView bounds].size.height * zoomScale;
    //
    //	CGImageRef cr = CGImageCreateWithImageInRect([[imageView image] CGImage], rect);
    //	NSLog(@"x :%f",rect.origin.x);
    //    NSLog(@"y :%f",rect.origin.y);
    //    NSLog(@"width :%f",rect.size.width);
    //    NSLog(@"height :%f",rect.size.height);
    //	UIImage *cropped = [UIImage imageWithCGImage:cr];
    //
    //	CGImageRelease(cr);
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    image = [UIImage imageWithData:imageData];
    
    NSLog(@"x :%f",image.size.width);
    NSLog(@"y :%f",image.size.height);
	[delegate imageCropper:self didFinishCroppingWithImage:image];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return imageView;
}

@end
