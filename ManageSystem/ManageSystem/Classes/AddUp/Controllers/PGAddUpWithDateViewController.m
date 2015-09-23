//
//  PGAddUpWithDateViewController.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGAddUpWithDateViewController.h"

#import "PGAddUpAllCell.h"

#import "PGDeskAddupCell.h"

@interface PGAddUpWithDateViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITextField *dateTF;

@property (nonatomic, strong) UIToolbar *dateToolBar;

@property (nonatomic, strong) UIDatePicker *datePicker;
@end

@implementation PGAddUpWithDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    
    [self customeNavigationBar];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)customeNavigationBar
{
    UIButton *dateButtonn = [UIButton buttonWithType:UIButtonTypeCustom];
    dateButtonn.frame = CGRectMake(0, 0, 180, CGRectGetHeight(self.navigationController.navigationBar.frame));
    [dateButtonn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dateButtonn setTitle:@"9月18日统计" forState:UIControlStateNormal];
    [dateButtonn setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    [dateButtonn addTarget:self action:@selector(showDatePicker) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dateTF];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"安全" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAction)];
    
    self.dateTF = [[UITextField alloc] initWithFrame:CGRectZero];
    self.dateTF.inputView = self.datePicker;
    self.dateTF.inputAccessoryView = self.dateToolBar;
    [self.view addSubview:self.dateTF];
    self.navigationItem.titleView = dateButtonn;
    self.navigationItem.rightBarButtonItem = rightItem;

}




- (UIToolbar *)dateToolBar
{
    if (_dateToolBar == nil) {
        _dateToolBar = [[ UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30 * BILI_WIDTH)];
        _dateToolBar.barStyle = UIBarStyleDefault;
        
        
        UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        doneBtn.frame = CGRectMake(0, 0, 44, 30);
        [doneBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [doneBtn setTitle:@"确定" forState:UIControlStateNormal];
        [doneBtn.titleLabel setFont:[UIFont systemFontOfSize:14 * BILI_WIDTH]];
         [doneBtn addTarget:self action:@selector(selectedDateAction:) forControlEvents:UIControlEventTouchUpInside];
    
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(0, 0, 44, 30);
        [cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:14 * BILI_WIDTH]];
        [cancelBtn addTarget:self action:@selector(datePickerCancelTouched:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIBarButtonItem *doneButton   = [[UIBarButtonItem alloc] initWithCustomView:doneBtn];
        UIBarButtonItem *cancleButton = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
        
        UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithTitle:@"选择日期"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:nil
                                                                       action:nil];
        titleButton.tintColor = [UIColor lightGrayColor];
        
        UIBarButtonItem *spaceButton1  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                       target:nil
                                                                                       action:nil];
        UIBarButtonItem *spaceButton2  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                       target:nil
                                                                                       action:nil];
        
        
        [_dateToolBar setItems:@[cancleButton,  spaceButton1 ,titleButton, spaceButton2, doneButton]];
    }
    return _dateToolBar;
}


- (UIDatePicker *)datePicker
{
    if (_datePicker == nil) {
        
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        [_datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh-Hans"]];
        
    }
    return _datePicker;
}



#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    if (section == 0) {
        rows = 1;
    }else{
        rows = 13;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *headCellID = @"headCell";
    static NSString *deskCellID = @"deskCell";
    
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case 0:
        {
            PGAddUpAllCell *addAllCell = (PGAddUpAllCell *)[tableView dequeueReusableCellWithIdentifier:headCellID];
            if (addAllCell == nil) {
                addAllCell = [[PGAddUpAllCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headCellID];
            }
            cell = addAllCell;
            
        }
            break;
        case 1:
        {
            PGDeskAddupCell *deskCell = (PGDeskAddupCell *)[tableView dequeueReusableCellWithIdentifier:deskCellID];
            if (deskCell == nil) {
                deskCell = [[PGDeskAddupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:deskCellID];
            }
            [deskCell drawCellWithDeskNum:[NSString stringWithFormat:@"K%li", indexPath.row + 1]];
            cell = deskCell;
        }
            break;
    
        default:
            break;
    }
    
    
    
    
    return cell;
    
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    
    if (indexPath.section == 0) {
        height = kPGAddUpAllCellHeight;
    }else
    {
        height = kPGDeskAddupCellHeight;
    }
    return height;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight = .0;
    if (section == 0) {
        headerHeight = .0;
    }else{
        headerHeight = 4 * BILI_WIDTH;
    }
    return headerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerID = @"header";
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (header == nil) {
        header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 4 * BILI_WIDTH)];
        header.backgroundColor = PG_BG_GREY;
        
    }
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PGDeskAddupViewController *desk = [[PGDeskAddupViewController alloc] init];
    [self.navigationController pushViewController:desk animated:YES];
    
}

- (void)showDatePicker{
    [self.dateTF becomeFirstResponder];
}
- (void)selectedDateAction:(UIButton *)btn
{
    
}

- (void)datePickerCancelTouched:(UIButton *)btn
{
    [self.dateTF resignFirstResponder];
}


- (void)deleteAction{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您确定要删除当天的数据吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
