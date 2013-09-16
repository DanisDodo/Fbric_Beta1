//
//  LLDPageView.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLDPageView : UIView

@property (strong, nonatomic) UIImage *cover;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSString *title;

-(id)initWithTitle:(NSString *)title cover:(UIImage *)cover date:(NSDate *)startDate;

@end
