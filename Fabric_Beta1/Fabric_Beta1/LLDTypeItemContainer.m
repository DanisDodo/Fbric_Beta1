//
//  LLDTypeItemContainer.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-18.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDTypeItemContainer.h"

@interface LLDTypeItemContainer ()

@property (strong, nonatomic) NSArray *items;

@end

@implementation LLDTypeItemContainer

@synthesize title = _title;
@synthesize selectedItem = _selectedItem;
@synthesize items = _items;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithTitle:(NSString *)title items:(NSArray *)items selectedItem:(LLDTypeItem *)selectedItem frame:(CGRect )frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        self.items = items;
        self.selectedItem = selectedItem;
        int num = 0;
        for (LLDTypeItem *item in self.items) {
            if (item == self.selectedItem) {
                [item itemSelected];
            }
            item.delegate = self;
            item.frame = CGRectMake(num*72, 5, 72, 72);
            [self addSubview:item];
            num++;
        }
    }
    return self;
}

#pragma mark -
#pragma mark LLDItemDelegate methods
-(void)selectItem:(LLDTypeItem *)item{
    if (item == self.selectedItem) {
        self.selectedItem = nil;
    }else{
        [self.selectedItem itemUnselected];
        self.selectedItem = item;
    }
    NSLog(@"%@",self.selectedItem.name);
    [self.delegate typeItemContainer:self typeItemChanged:self.selectedItem];
}
-(void)unselectItem:(LLDTypeItem *)item{
    
}

@end
