//
//  LLDDataManager.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-12.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDDataManager.h"
#import "LLDAppDelegate.h"

@interface LLDDataManager()

@property (strong, nonatomic) NSManagedObjectContext *context;

@end


@implementation LLDDataManager

static LLDDataManager *_singleton;

@synthesize context = _context;

+(LLDDataManager *)sharedDataManager{
    if (!_singleton) {
        _singleton = [[LLDDataManager alloc]init];
    }
    return _singleton;
}
-(id)init{
    self = [super init];
    if (self) {
        LLDAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        self.context = [appDelegate managedObjectContext];
    }
    return self;
}

-(NSArray *)allObjects{
    NSEntityDescription *description = [NSEntityDescription entityForName:@"MemorialDay" inManagedObjectContext:self.context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:description];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"createdDate" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    NSError *error;
    NSArray *objects = [self.context executeFetchRequest:request error:&error];
    
    return objects;
}
-(MemorialDay *)objectForID:(NSManagedObjectID *)objectID{
    return (MemorialDay *)[self.context objectWithID:objectID];
}

-(BOOL)deleteObject:(MemorialDay *)memDay{
    [self.context deleteObject:memDay];
    NSError *error;
    return [self.context save:&error];
}

-(BOOL)updateObjecWith:(MemorialDay *) memDay{
    NSError *error;
    memDay.coverData = UIImagePNGRepresentation(memDay.cover);
    return [self.context save:&error];
}

-(BOOL)insertObjectWithTitle:(NSString *)title type:(MemorialType) type startDate:(NSDate *)startDate cover:(UIImage *)cover{
    MemorialDay *memDay = (MemorialDay *)[NSEntityDescription insertNewObjectForEntityForName:@"MemorialDay" inManagedObjectContext:self.context];
    memDay.title = title;
    memDay.type = [NSNumber numberWithInt:type];
    memDay.startDate = startDate;
    memDay.cover = cover;
    memDay.coverData = UIImagePNGRepresentation(cover);
    NSError *error;
    return [self.context save:&error];
}


@end
