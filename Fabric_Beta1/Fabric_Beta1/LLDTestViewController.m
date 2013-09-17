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
#import "LLDActionView.h"
#import "LLDActionDatePicker.m"

@interface LLDTestViewController ()

@property (strong, nonatomic) UIButton *showButton;
@property (nonatomic) BOOL isHidden;
@property (strong, nonatomic) LLDActionView *actionView;

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
    self.isHidden = YES;
    self.showButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.showButton.frame = CGRectMake(0, 0, 60, 30);
    [self.showButton setTitle:@"button" forState:UIControlStateNormal];
    [self.showButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)clickButton{
    self.actionView = [[LLDActionView alloc]init];
    [self.actionView showInView:self.view];
//    LLDActionDatePicker *picker = [[LLDActionDatePicker alloc]init];
//    [picker showInView:self.view];
}

@end
