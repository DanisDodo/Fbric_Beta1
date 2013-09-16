//
//  LLDEditViewController.m
//  Fabric_Beta1
//
//  Created by Danis on 13-9-13.
//  Copyright (c) 2013年 Danis. All rights reserved.
//

#import "LLDEditViewController.h"
#import "MemorialDay.h"
#import "NSDate+Helper.h"
#import "LLDDataManager.h"
#import "LLDTableViewController.h"

#define CELL_X                  20
#define TITLE_FIELD_Y           60
#define TITLE_FIELD_WIDTH       280
#define TITLE_FIELD_HEIGHT      40
#define CELL_INTERVAL           20
#define BACK_BUTTON_X           10
#define BACK_BUTTON_Y           10
#define BACK_BUTTON_LENGTH      40
#define DATE_PICKER_HEIGHT      215
#define IMAGE_PICK_BUTTON_LENGTH    40

@interface LLDEditViewController ()

@property (nonatomic) BOOL isInsert;

@property (strong, nonatomic) MemorialDay *memDay;
@property (strong, nonatomic) UITextField *titleField;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIImageView *backgroundImageView;

@property (strong, nonatomic) UIButton *doneButton;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *pickButton;

@property (strong,nonatomic) NSDate *tempDate;
@property (strong, nonatomic) UIImage *tempImage;

@end

@implementation LLDEditViewController

@synthesize jumpDelegate = _jumpDelegate;
@synthesize memDay = _memDay;
@synthesize titleField = _titleField;
@synthesize backgroundImageView = _backgroundImageView;
@synthesize dateLabel = _dateLabel;
@synthesize datePicker = _datePicker;
@synthesize doneButton = _doneButton;
@synthesize cancelButton = _cancelButton;
@synthesize pickButton = _pickButton;
@synthesize isInsert = _isInsert;

@synthesize tempDate = _tempDate;
@synthesize tempImage = _tempImage;

-(id)initWithMemorialDay:(MemorialDay *)memDay{
    self = [super init];
    if (self) {
        self.memDay = memDay;
        if (!memDay) {
            self.isInsert = YES;
        }else{
            self.isInsert = NO;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    self.backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancelButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    self.cancelButton.frame = CGRectMake(BACK_BUTTON_X, BACK_BUTTON_Y, BACK_BUTTON_LENGTH, BACK_BUTTON_LENGTH);
    [self.cancelButton addTarget:self action:@selector(editCanceled) forControlEvents:UIControlEventTouchUpInside];
    
    self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.doneButton setImage:[UIImage imageNamed:@"yes.png"] forState:UIControlStateNormal];
    self.doneButton.frame = CGRectMake(screenSize.width-BACK_BUTTON_LENGTH-BACK_BUTTON_X, BACK_BUTTON_Y, BACK_BUTTON_LENGTH, BACK_BUTTON_LENGTH);
    [self.doneButton addTarget:self action:@selector(editDone) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleField = [[UITextField alloc]initWithFrame:CGRectMake(CELL_X, TITLE_FIELD_Y, TITLE_FIELD_WIDTH, TITLE_FIELD_HEIGHT)];
    self.titleField.borderStyle = UITextBorderStyleNone;
    self.titleField.backgroundColor = [UIColor colorWithRed:(float)81/255 green:(float)185/255 blue:(float)143/255 alpha:1];

    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CELL_X, TITLE_FIELD_Y+TITLE_FIELD_HEIGHT+CELL_INTERVAL, TITLE_FIELD_WIDTH, TITLE_FIELD_HEIGHT)];
    self.dateLabel.backgroundColor = [UIColor lightGrayColor];
    UITapGestureRecognizer *dateChooseTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseDate)];
    [dateChooseTap setNumberOfTapsRequired:1];
    [dateChooseTap setNumberOfTouchesRequired:1];
    self.dateLabel.userInteractionEnabled = YES;
    [self.dateLabel addGestureRecognizer:dateChooseTap];
    
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, screenSize.height-DATE_PICKER_HEIGHT, screenSize.width, DATE_PICKER_HEIGHT)];
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    
    //init the tempDate
    self.tempDate = [NSDate localDate];
    
    self.pickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pickButton setImage:[UIImage imageNamed:@"pick_image.png"] forState:UIControlStateNormal];
    self.pickButton.frame = CGRectMake(screenSize.width/2-IMAGE_PICK_BUTTON_LENGTH/2, screenSize.height-DATE_PICKER_HEIGHT-IMAGE_PICK_BUTTON_LENGTH-CELL_INTERVAL, IMAGE_PICK_BUTTON_LENGTH, IMAGE_PICK_BUTTON_LENGTH);
    [self.pickButton addTarget:self action:@selector(pickImage) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.memDay) {
        self.titleField.text = self.memDay.title;
        self.dateLabel.text = [self.memDay.startDate toStringOfYearMonthDay];
        self.backgroundImageView.image = self.memDay.cover;
    }else{
        self.titleField.placeholder = @"请输入主题";
        NSDate *date = [NSDate localDate];
        NSString *dateString = [date toStringOfYearMonthDay];
        [self.dateLabel setText:dateString];
    }
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.cancelButton];
    [self.view addSubview:self.doneButton];
    [self.view addSubview:self.titleField];
    [self.view addSubview:self.dateLabel];
    [self.view addSubview:self.datePicker];
    [self.view addSubview:self.pickButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pickImage{
    LLDImagePickerController *imagePickerController = [[LLDImagePickerController alloc]init];
    imagePickerController.pickAndCropDelegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

-(void)chooseDate{
    [self.titleField resignFirstResponder];
}

-(void)dateChanged:(id)sender{
    self.tempDate = [self.datePicker date];
    self.dateLabel.text = [self.datePicker.date toStringOfYearMonthDay];
}
-(void)editCanceled{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)editDone{
    LLDDataManager *dataManager = [LLDDataManager sharedDataManager];
    if (self.isInsert) {
        [dataManager insertObjectWithTitle:self.titleField.text type:default_day startDate:self.tempDate cover:self.tempImage];
        [self dismissViewControllerAnimated:YES completion:nil];
        [((LLDTableViewController *)self.jumpDelegate) reloadData];
    }
}
#pragma mark
#pragma mark LLDImagePickerDelegate methods
-(void)imagePicker:(LLDImagePickerController *)picker didFinishPickingAndCroppingWithImage:(UIImage *)image{
    self.tempImage = image;
    self.backgroundImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerDidCancel:(LLDImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
