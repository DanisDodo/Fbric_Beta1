//
//  LLDPageView.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDPageView.h"

@interface LLDPageView ()

@end


@implementation LLDPageView

@synthesize title = _title;
@synthesize cover = _cover;
@synthesize startDate = _startDate;

-(id)initWithTitle:(NSString *)title cover:(UIImage *)cover date:(NSDate *)startDate{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


@end
