//
//  NSDate+Helper.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-12.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

+(NSDate *)localDate;
-(int)daysFromDate:(NSDate *)pastDate;
-(NSString *)toStringOfYearMonthDay;

@end
