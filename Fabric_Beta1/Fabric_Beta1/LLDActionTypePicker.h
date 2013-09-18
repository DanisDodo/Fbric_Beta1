//
//  LLDActionTypePicker.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-18.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDActionDatePicker.h"
#import "LLDTypeItemContainer.h"

@class LLDTypeItemContainer;

@protocol LLDActionTypePickerDelegate;

@interface LLDActionTypePicker : LLDActionView
  <LLDTypeItemContainerDelegate>

@property (strong, nonatomic) LLDTypeItemContainer *itemContainer;

@property (strong, nonatomic) id<LLDActionTypePickerDelegate> delegate;

@end

@protocol LLDActionTypePickerDelegate <NSObject>

-(void)actionTypePicker:(LLDActionTypePicker *)picker typeItemChanged:(LLDTypeItem *)item;

@end
