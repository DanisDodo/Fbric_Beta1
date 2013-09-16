//
//  LLDImagePickerViewController.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-16.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLDImageCropper.h"

@protocol LLDImagePickerControllerDelegate;

@interface LLDImagePickerController : UIImagePickerController
<UINavigationControllerDelegate,UIImagePickerControllerDelegate,LLDImageCropperDelegate>
{
    id<LLDImagePickerControllerDelegate> pickAndCropDelegate;
}
@property (strong, nonatomic) id<LLDImagePickerControllerDelegate> pickAndCropDelegate;

@end

@protocol LLDImagePickerControllerDelegate <NSObject>

-(void)imagePicker:(LLDImagePickerController *)picker didFinishPickingAndCroppingWithImage:(UIImage *)image;
-(void)imagePickerDidCancel:(LLDImagePickerController *)picker;

@end