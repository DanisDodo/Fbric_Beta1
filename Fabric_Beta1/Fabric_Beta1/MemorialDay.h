//
//  MemorialDay.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-12.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MemorialDay : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSData * coverData;
@property (nonatomic, retain) UIImage * cover;

@end
