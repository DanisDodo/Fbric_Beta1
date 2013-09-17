//
//  LLDActionView.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-17.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LLDActionView : UIView

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *doneButton;
@property (strong, nonatomic) UIView *contentView;

-(void)showInView:(UIView *)parentView;
-(void)hidden;

@end
