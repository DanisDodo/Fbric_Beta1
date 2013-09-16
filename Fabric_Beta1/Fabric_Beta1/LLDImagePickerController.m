//
//  LLDImagePickerViewController.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-16.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDImagePickerController.h"

@interface LLDImagePickerController ()

@end

@implementation LLDImagePickerController

@synthesize pickAndCropDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    
}
//暂时添加的进行界面重绘


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    LLDImageCropper *cropper = [[LLDImageCropper alloc]initWithImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"]];
    cropper.delegate = self;
    [self pushViewController:cropper animated:YES];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [pickAndCropDelegate imagePickerDidCancel:self];
}
-(void)imageCropper:(LLDImageCropper *)cropper didFinishCroppingWithImage:(UIImage *)image{
    [pickAndCropDelegate imagePicker:self didFinishPickingAndCroppingWithImage:image];
}
-(void)imageCropperDidCancel:(LLDImageCropper *)cropper{
    [pickAndCropDelegate imagePickerDidCancel:self];
}
@end



