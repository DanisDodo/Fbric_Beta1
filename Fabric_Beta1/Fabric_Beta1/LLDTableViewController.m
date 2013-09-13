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

#define CellIdentifier  @"MemDayCellIdentifier"

@interface LLDTableViewController ()

@property (strong, nonatomic) LLDDataManager *dataManager;
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UIButton *addButton;

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
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    if (self) {
        //init the tableView
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, screenBounds.size.width, screenBounds.size.height-160) style:UITableViewStylePlain];
        UINib *nib = [UINib nibWithNibName:@"LLDMemorialCell" bundle:nil];
        [self.tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        //init the dataManager
        self.dataManager = [LLDDataManager sharedDataManager];
        //init the memList
        self.memList = [NSMutableArray arrayWithArray:[self.dataManager allObjects]];
        //init the backgroundImage
        if (self.memList.count == 0) {
            if (DEVICE_IS_RETINA_4) {
                self.backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default_back_568h@2x.png"]];
            }else if(DEVICE_IS_RETINA){
                self.backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default_back@2x.png"]];
            }else{
                self.backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default_back.png"]];
            }
        }else{
            self.backgroundImageView = [[UIImageView alloc]initWithImage:((MemorialDay *)[self.memList objectAtIndex:0]).cover];
        }
        [self.backgroundImageView setContentMode:UIViewContentModeBottomLeft];
        //init the header
        self.headerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
        self.headerImageView.frame = CGRectMake(0, 0, screenBounds.size.width,160);
        //init the addButton
        self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addButton setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
        self.addButton.frame = CGRectMake(260, 70, 30, 30);
        
        
        [self.view addSubview:self.backgroundImageView];
        [self.view addSubview:self.tableView];
        [self.view addSubview:self.headerImageView];
        [self.view addSubview:self.addButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
@end
