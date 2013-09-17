//
//  LLDActionDatePicker.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-17.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDActionDatePicker.h"

@interface LLDActionDatePicker (){
    CGSize screenSize;
}

@end

@implementation LLDActionDatePicker

@synthesize datePicker = _datePicker;
@synthesize delegate = _delegate;

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
    screenSize = [UIScreen mainScreen].bounds.size;
    if (self) {
        self.titleLabel.text = @"选取时间";
        
        self.datePicker = [[UIDatePicker alloc]init];
        self.datePicker.frame = CGRectMake(10, 2, screenSize.width-20,166-4);
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        [self.datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.datePicker];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void)datePickerValueChanged{
    [self.delegate actionDatePicker:self dateChanged:[self.datePicker date]];
}
@end
