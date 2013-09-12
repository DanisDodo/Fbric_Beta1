//
//  MemorialDay.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-12.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "MemorialDay.h"
#import "NSDate+Helper.h"


@implementation MemorialDay

@dynamic title;
@dynamic type;
@dynamic startDate;
@dynamic createdDate;
@dynamic coverData;
@dynamic cover;

-(void)awakeFromFetch{
    UIImage *image = [UIImage imageWithData:self.coverData];
    [self setPrimitiveValue:image forKey:@"cover"];
}
-(void)awakeFromInsert{
    self.createdDate = [NSDate localDate];
}
@end
