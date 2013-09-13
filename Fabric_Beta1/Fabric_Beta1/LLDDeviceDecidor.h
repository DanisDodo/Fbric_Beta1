//
//  LLDDeviceDecidor.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEVICE_IS_RETINA_4   ([[UIScreen mainScreen]currentMode].size.height == 1136)
#define DEVICE_IS_RETINA  ([[UIScreen mainScreen]currentMode].size.height == 960)

@interface LLDDeviceDecidor : NSObject

@end
