//
//  LLDTestViewController.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-12.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDTestViewController.h"
#import "MemorialDay.h"
#import "LLDDataManager.h"
#import "MemorialType.h"
#import "NSDate+Helper.h"

@interface LLDTestViewController ()

@end

@implementation LLDTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    LLDDataManager *manager = [LLDDataManager sharedDataManager];
//    NSArray *array = [manager allObjects];
//    MemorialDay *day = [array objectAtIndex:0];
//    day.startDate = [NSDate date];
//    [manager updateObjecWith:day];
//    NSLog(@"%@",day.title);
//    NSLog(@"%@",day.type);
//    NSLog(@"%@",day.startDate);
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:day.cover];
//    [self.view addSubview:imageView];
//
    NSDate *now = [NSDate localDate];
    NSDate *past = [NSDate dateWithTimeInterval:-100000 sinceDate:now];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
