//
//  LLDActionView.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-17.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDActionView.h"
#import <QuartzCore/QuartzCore.h>

@interface LLDActionView(){
    CGSize screenSize;
    BOOL isHidden;
}

@end

@implementation LLDActionView

@synthesize titleLabel = _titleLabel;
@synthesize doneButton = _doneButton;
@synthesize contentView = _contentView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init{
    self = [super init];
    if (self) {
        screenSize = [UIScreen mainScreen].bounds.size;
        isHidden = YES;
        self.frame = CGRectMake(0, screenSize.height, screenSize.width, 216);
        self.backgroundColor = [UIColor whiteColor];

        [self.layer setShadowColor:[UIColor darkGrayColor].CGColor];
        [self.layer setShadowOffset:CGSizeMake(0, -3)];
        [self.layer setShadowOpacity:1];
        [self.layer setShadowRadius:4];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 100, 30)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont fontWithName:@"Arial" size:15.0];
        self.titleLabel.text = @"label";
        
        self.doneButton = [[UIButton alloc]initWithFrame:CGRectMake(245, 10, 60, 30)];
        [self.doneButton setTitle:@"done" forState:UIControlStateNormal];
        [self.doneButton setTintColor:[UIColor whiteColor]];
        [self.doneButton setBackgroundImage:[UIImage imageNamed:@"done_background.png"] forState:UIControlStateNormal];
        [self.doneButton addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        
        self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, screenSize.width, 166)];
        self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.contentView.layer setBorderWidth:1];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.doneButton];
        [self addSubview:self.contentView];
    }
    return self;
}

-(void)showInView:(UIView *)parentView{
    if (isHidden) {
        [parentView addSubview:self];
        [self show];
    }else{
        [self hidden];
    }

}
-(void)show{
    [UIView beginAnimations:@"show" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [self setFrame:CGRectMake(0, screenSize.height-216, screenSize.width, 216)];
    [self setAlpha:1];
    [UIView commitAnimations];
    isHidden = !isHidden;
    
}
-(void)hidden{
    [UIView beginAnimations:@"hidden" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [self setFrame:CGRectMake(0, screenSize.height, screenSize.width, 216)];
    [self setAlpha:0];
    [UIView commitAnimations];
    isHidden = !isHidden;
}

@end
