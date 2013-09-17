//
//  LLDActionDatePicker.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-17.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDActionDatePicker.h"
#import "LLDActionView.h"

@interface LLDActionDatePicker (){
    CGSize screenSize;
}

@end

@implementation LLDActionDatePicker

@synthesize datePicker = _datePicker;

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
        self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, 10, screenSize.width-20,166-20)];
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
    
}


@end
