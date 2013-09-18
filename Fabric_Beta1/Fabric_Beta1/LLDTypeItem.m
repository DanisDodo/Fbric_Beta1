//
//  LLDTypeItem.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-18.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDTypeItem.h"

@interface LLDTypeItem(){
    BOOL isSelected;
}

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *nameLabel;

@end

@implementation LLDTypeItem

@synthesize name = _name;
@synthesize image = _image;
@synthesize type = _type;
@synthesize imageView = _imageView;
@synthesize nameLabel = _nameLabel;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithName:(NSString *)name image:(UIImage *)image type:(MemorialType)type{
    self = [super init];
    if (self) {
        isSelected = NO;
        self.bounds = CGRectMake(0, 0, 72, 72);
        self.name = name;
        self.image = image;
        self.type = type;
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.frame = CGRectMake(5, 55, 62, 12);
        self.nameLabel.text = self.name;
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(16, 5, 40, 40)];
        if (self.image) {
            self.imageView.image = image;
        }else{
            self.imageView.image = [UIImage imageNamed:@"close.png"];
        }
        
        [self addSubview:self.imageView];
        [self addSubview:self.nameLabel];
    }
    return self;
}

#pragma mark -
#pragma mark LLDSelectableItem methods

//isSelected 为item的当前状态，item只对自己的状态负责
-(void)itemSelected{
    self.backgroundColor = [UIColor lightGrayColor];
    [self.delegate selectItem:self];
    isSelected = YES;
}
-(void)itemUnselected{
    self.backgroundColor = [UIColor clearColor];
    [self.delegate unselectItem:self];
    isSelected = NO;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (isSelected) {
        [self itemUnselected];
    }else{
        [self itemSelected];
    }
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
