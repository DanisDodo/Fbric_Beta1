//
//  LLDEditViewController.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLDImagePickerController.h"

@class MemorialDay;
@class LLDTableViewController;

@interface LLDEditViewController : UIViewController
  <LLDImagePickerControllerDelegate>


@property (strong, nonatomic) id jumpDelegate;  //在跳转回去后，重新读取数据s

-(id)initWithMemorialDay:(MemorialDay *)memDay;


@end
