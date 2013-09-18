//
//  LLDTypeItemContainer.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-18.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLDTypeItem.h"

@protocol LLDTypeItemContainerDelegate;

@interface LLDTypeItemContainer : UIView
  <LLDItemDelegate>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) LLDTypeItem *selectedItem;

@property (strong, nonatomic) id<LLDTypeItemContainerDelegate> delegate;

-(id)initWithTitle:(NSString *)title items:(NSArray *)items selectedItem:(LLDTypeItem *)selectedItem frame:(CGRect )frame ;

@end

@protocol LLDTypeItemContainerDelegate <NSObject>

-(void)typeItemContainer:(LLDTypeItemContainer *)container typeItemChanged:(LLDTypeItem *)item;

@end