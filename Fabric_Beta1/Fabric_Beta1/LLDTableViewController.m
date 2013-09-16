//
//  LLDTableViewController.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDTableViewController.h"
#import "LLDDataManager.h"
#import "LLDDeviceDecidor.h"
#import "LLDMemorialCell.h"
#import "MemorialDay.h"
#import "NSDate+Helper.h"
#import "LLDEditViewController.h"

#define CellIdentifier  @"MemDayCellIdentifier"
#define TABLEVIEW_HEIGHT    300
#define HEADERVIEW_HEIGHT   160
#define ADDBUTTON_LENGTH    15
#define ADDBUTON_X          280
#define ADDBUTTON_Y         80

@interface LLDTableViewController ()

@property (strong, nonatomic) LLDDataManager *dataManager;
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UIButton *addButton;
@property (strong, nonatomic) NSIndexPath *cellIndexNeedsToBeDeleted;

@end

@implementation LLDTableViewController

@synthesize tableView = _tableView;
@synthesize memList = _memList;
@synthesize backgroundImageView = _backgroundImageView;
@synthesize dataManager = _dataManager;
@synthesize headerImageView = _headerImageView;
@synthesize addButton = _addButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    //init the dataManager
    self.dataManager = [LLDDataManager sharedDataManager];
    //init the tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, HEADERVIEW_HEIGHT, screenBounds.size.width, screenBounds.size.height-HEADERVIEW_HEIGHT-20) style:UITableViewStylePlain];
    UINib *nib = [UINib nibWithNibName:@"LLDMemorialCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    self.backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];
    //init the memList
    self.memList = [NSMutableArray arrayWithArray:[self.dataManager allObjects]];
    //init the backgroundImage
    BOOL isCoverExist = NO;
    for (MemorialDay *memDay in self.memList) {
        if (memDay.cover) {
            self.backgroundImageView.image = memDay.cover;
            isCoverExist = YES;
            break;
        }
    }
    if (!isCoverExist) {
        if (DEVICE_IS_RETINA_4) {
            [self.backgroundImageView setImage:[UIImage imageNamed:@"default_back_568h@2x.jpg"]];
        }else if(DEVICE_IS_RETINA){
            [self.backgroundImageView setImage:[UIImage imageNamed:@"default_back@2x.jpg"]];
        }else{
            [self.backgroundImageView setImage:[UIImage imageNamed:@"default_back.jpg"]];
        }
    }
    [self.backgroundImageView setContentMode:UIViewContentModeTopLeft];
    //init the header
    self.headerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
    self.headerImageView.frame = CGRectMake(0, 0, screenBounds.size.width,HEADERVIEW_HEIGHT);
    //init the addButton
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    self.addButton.frame = CGRectMake(ADDBUTON_X, ADDBUTTON_Y, ADDBUTTON_LENGTH, ADDBUTTON_LENGTH);
    [self.addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.headerImageView];
    [self.view addSubview:self.addButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reloadData{
    //init the memList
    self.memList = [NSMutableArray arrayWithArray:[self.dataManager allObjects]];
    //init the backgroundImage
    BOOL isCoverExist = NO;
    for (MemorialDay *memDay in self.memList) {
        if (memDay.cover) {
            self.backgroundImageView.image = memDay.cover;
            isCoverExist = YES;
            break;
        }
    }
    if (!isCoverExist) {
        if (DEVICE_IS_RETINA_4) {
            [self.backgroundImageView setImage:[UIImage imageNamed:@"default_back_568h@2x.jpg"]];
        }else if(DEVICE_IS_RETINA){
            [self.backgroundImageView setImage:[UIImage imageNamed:@"default_back@2x.jpg"]];
        }else{
            [self.backgroundImageView setImage:[UIImage imageNamed:@"default_back.jpg"]];
        }
    }
    [self.tableView reloadData];
}


#pragma mark
#pragma mark tableview datasource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.memList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LLDMemorialCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSInteger row = [indexPath row];
    MemorialDay *memDay = (MemorialDay *)[self.memList objectAtIndex:row];
    int count = [[NSDate localDate]daysFromDate:memDay.startDate];
    cell.titleLabel.text = memDay.title;
    cell.countLabel.text = [NSString stringWithFormat:@"%d",count];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
#pragma mark - 
#pragma mark tableview delegate methods
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        self.cellIndexNeedsToBeDeleted = indexPath;
        NSString *title = ((MemorialDay *)[self.memList objectAtIndex:indexPath.row]).title;
        NSString *message = [NSString stringWithFormat:@"您确定要删除%@吗？",title];
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:message delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"delete" otherButtonTitles: nil];
        [sheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        [sheet showInView:self.view];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = [indexPath row];
    
}


#pragma mark - 
#pragma mark button click method
-(void)addButtonClick{
    LLDEditViewController *editController = [[LLDEditViewController alloc]initWithMemorialDay:nil];
    editController.jumpDelegate = self;
    [self presentViewController:editController animated:YES completion:nil];
}
#pragma mark UIActionSheetDelegate methods
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //dataManager, memList, tableView 在这三个当中删除这个元素的顺序不能换
        [self.dataManager deleteObject:((MemorialDay *)[self.memList objectAtIndex:self.cellIndexNeedsToBeDeleted.row])];
        [self.memList removeObjectAtIndex:self.cellIndexNeedsToBeDeleted.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:self.cellIndexNeedsToBeDeleted] withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"%d",[self.memList count]);
        NSLog(@"%d",[self.dataManager allObjects].count);
    }
}
@end
