//
//  LLDTableViewController.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLDTableViewController : UIViewController
  <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImageView *backgroundImageView;

@property (strong, nonatomic) NSMutableArray *memList;

@end
