//
//  LLDDataManager.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-12.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemorialDay.h"
#import "MemorialType.h"

@interface LLDDataManager : NSObject

+(LLDDataManager *)sharedDataManager;

-(MemorialDay *)objectForID:(NSManagedObjectID *)objectID;
-(NSArray *)allObjects;

-(BOOL)deleteObject:(MemorialDay *)memDay;
-(BOOL)updateObjecWith:(MemorialDay *) memDay;
-(BOOL)insertObjectWithTitle:(NSString *)title type:(MemorialType) type startDate:(NSDate *)startDate cover:(UIImage *)cover;

@end
