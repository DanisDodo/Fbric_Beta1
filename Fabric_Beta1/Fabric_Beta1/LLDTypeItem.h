//
//  LLDTypeItem.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-18.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLDSelectableItem.h"
#import "MemorialType.h"

@protocol LLDItemDelegate;

@interface LLDTypeItem : UIView
  <LLDSelectableItem>

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) MemorialType type;

@property (strong, nonatomic) id<LLDItemDelegate> delegate;

-(id)initWithName:(NSString *)name image:(UIImage *)image type:(MemorialType)type;

@end

@protocol LLDItemDelegate <NSObject>

-(void)selectItem:(LLDTypeItem *)item;
-(void)unselectItem:(LLDTypeItem *)item;

@end