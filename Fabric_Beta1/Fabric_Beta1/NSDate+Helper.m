//
//  NSDate+Helper.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-12.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

+(NSDate *)localDate{
    NSDate *date = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    return localeDate;
}
-(int)daysFromDate:(NSDate *)pastDate{
    NSTimeInterval interval = [[NSDate localDate]timeIntervalSinceDate:pastDate];
    return interval/86400;
}
-(NSString *)toStringOfYearMonthDay{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self];
    
    NSInteger day = [components day];
    NSInteger month= [components month];
    NSInteger year= [components year];
    return [NSString stringWithFormat:@"%d年%d月%d日",year,month,day];
}

@end
