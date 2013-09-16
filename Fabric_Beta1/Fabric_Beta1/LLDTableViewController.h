//
//  LLDTableViewController.h
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLDTableViewController : UIViewController
  <UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImageView *backgroundImageView;

@property (strong, nonatomic) NSMutableArray *memList;

//重新从CoreData读取数据，并刷新界面
-(void)reloadData;

@end
