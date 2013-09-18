//
//  LLDSelectableItem.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-18.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LLDSelectableItem <NSObject>

-(void)itemSelected;
-(void)itemUnselected;

@end
