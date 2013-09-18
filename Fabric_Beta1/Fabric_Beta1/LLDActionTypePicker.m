//
//  LLDActionTypePicker.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-18.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDActionTypePicker.h"
#import "LLDTypeItem.h"

@implementation LLDActionTypePicker

@synthesize itemContainer = _itemContainer;
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
    if (self) {
        LLDTypeItem *item1 = [[LLDTypeItem alloc]initWithName:@"birthday" image:nil type:birthday];
        LLDTypeItem *item2 = [[LLDTypeItem alloc]initWithName:@"normal" image:nil type:default_day];
        self.itemContainer = [[LLDTypeItemContainer alloc]initWithTitle:@"day type" items:[NSArray arrayWithObjects:item1,item2, nil] selectedItem:nil frame:CGRectMake(0, 0, 320, 166)];
        self.itemContainer.delegate = self;
        [self.contentView addSubview:self.itemContainer];
    }
    return self;
}
-(void)typeItemContainer:(LLDTypeItemContainer *)container typeItemChanged:(LLDTypeItem *)item{
    [self.delegate actionTypePicker:self typeItemChanged:item];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
