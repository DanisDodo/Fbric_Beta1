//
//  LLDActionDatePicker.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-17.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDActionView.h"

@protocol LLDActionDatePickerDelegate;


@interface LLDActionDatePicker : LLDActionView

@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) id<LLDActionDatePickerDelegate> delegate;

@end

@protocol LLDActionDatePickerDelegate <NSObject>

-(void)actionDatePicker:(LLDActionDatePicker *) datePicker dateChanged:(NSDate *)date;

@end
