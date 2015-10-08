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
#import "PGTurnListTableViewController.h"
#import "DringsTableViewController.h"
#import "PGLoginViewController.h"

@interface PGAddUpWithDateViewController ()<UITableViewDataSource, UITableViewDelegate,UIAlertViewDelegate,PGAddUpAllCellDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

{
    UIButton *dateButton;
    
    NSDictionary *hederCellDataSource;
    NSArray *cellDataSource;
}

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
    [self netWorking];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)customeNavigationBar
{
    
    self.title = @"竞猜统计";
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    WS(weakself);
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        [weakself netWorking];
        
    }];
    
    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(0xf05e5a)];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.view.backgroundColor = UIColorFromRGB(0xECECEF);
    
//    dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    dateButton.frame = CGRectMake(0, 0, 180, CGRectGetHeight(self.navigationController.navigationBar.frame));
//    [dateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [dateButton setTitle:@"9月18日统计" forState:UIControlStateNormal];
//    [dateButton setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
//    [dateButton addTarget:self action:@selector(showDatePicker) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.dateTF];
//
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"top_icon_anquan"] style:UIBarButtonItemStylePlain target:self action:@selector(deleteAction)];
    
//    self.dateTF = [[UITextField alloc] initWithFrame:CGRectZero];
//    self.dateTF.inputView = self.datePicker;
//    self.dateTF.inputAccessoryView = self.dateToolBar;
//    [self.view addSubview:self.dateTF];
//    self.navigationItem.titleView = dateButton;
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"top_icon_exit"] style:UIBarButtonItemStylePlain target:self action:@selector(exitLogin)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];

}




//- (UIToolbar *)dateToolBar
//{
//    if (_dateToolBar == nil) {
//        _dateToolBar = [[ UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30 * BILI_WIDTH)];
//        _dateToolBar.barStyle = UIBarStyleDefault;
//        
//        
//        UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        doneBtn.frame = CGRectMake(0, 0, 44, 30);
//        [doneBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [doneBtn setTitle:@"确定" forState:UIControlStateNormal];
//        [doneBtn.titleLabel setFont:[UIFont systemFontOfSize:14 * BILI_WIDTH]];
//         [doneBtn addTarget:self action:@selector(selectedDateAction:) forControlEvents:UIControlEventTouchUpInside];
//    
//        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        cancelBtn.frame = CGRectMake(0, 0, 44, 30);
//        [cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
//        [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:14 * BILI_WIDTH]];
//        [cancelBtn addTarget:self action:@selector(datePickerCancelTouched:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        UIBarButtonItem *doneButton   = [[UIBarButtonItem alloc] initWithCustomView:doneBtn];
//        UIBarButtonItem *cancleButton = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
//        
//        UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithTitle:@"选择日期"
//                                                                        style:UIBarButtonItemStylePlain
//                                                                       target:nil
//                                                                       action:nil];
//        titleButton.tintColor = [UIColor lightGrayColor];
//        
//        UIBarButtonItem *spaceButton1  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                                                                       target:nil
//                                                                                       action:nil];
//        UIBarButtonItem *spaceButton2  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
//                                                                                       target:nil
//                                                                                       action:nil];
//        
//        
//        [_dateToolBar setItems:@[cancleButton,  spaceButton1 ,titleButton, spaceButton2, doneButton]];
//    }
//    return _dateToolBar;
//}


//- (UIDatePicker *)datePicker
//{
//    if (_datePicker == nil) {
//        
//        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
//        _datePicker.backgroundColor = [UIColor whiteColor];
//        _datePicker.datePickerMode = UIDatePickerModeDate;
//        _datePicker.minimumDate = [NSDate dateWithTimeInterval:-60 * 60*24*365*3 sinceDate:[NSDate date]];
//        _datePicker.maximumDate = [NSDate date];
//        [_datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh-Hans"]];
//        
//    }
//    return _datePicker;
//}


- (void)netWorking{
    
    WS(weakself);
    [[PGApiClient sharedManage] checkPgSytemTodayInfoWithDate:nil block:^(id response, BOOL isError, NSString *errorMessage) {
        
        if (isError) {
            [SVProgressHUD showErrorWithStatus:errorMessage];
        }else{
            hederCellDataSource = response;
            [weakself.tableView reloadData];
        }
    }];
    
    [[PGApiClient sharedManage] checkPGSystemAllDeskAmountWithDate:nil block:^(id response, BOOL isError, NSString *errorMessage) {
       
        [self.tableView.header endRefreshing];
        
        if (isError) {
            [SVProgressHUD showErrorWithStatus:errorMessage];
        }else{
            cellDataSource = response;
            [weakself.tableView reloadData];
        }
    }];
    
}

#pragma  cellDelagate

- (void)turnButtonAction{
    
    PGTurnListTableViewController *VC = [[PGTurnListTableViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)drinksButtonAction{
    
    DringsTableViewController * VC = [[DringsTableViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
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
        rows = cellDataSource.count;
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
                addAllCell.delegate = self;
            }
            addAllCell.dataSource = hederCellDataSource;
            cell = addAllCell;
            
        }
            break;
        case 1:
        {
            PGDeskAddupCell *deskCell = (PGDeskAddupCell *)[tableView dequeueReusableCellWithIdentifier:deskCellID];
            if (deskCell == nil) {
                deskCell = [[PGDeskAddupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:deskCellID];
            }
            deskCell.dataSource = cellDataSource[indexPath.row];
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
        height = 90 *BILI_WIDTH;
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
    
    if (0 == indexPath.section) {
        return;
    }
    
    PGDeskAddupViewController *desk = [[PGDeskAddupViewController alloc] init];
    NSDictionary *dic = cellDataSource[indexPath.row ];
    
    desk.deskID = [[dic objectforNotNullKey:@"id"] description];
    desk.title = [NSString stringWithFormat:@"D%@",[dic objectforNotNullKey:@"id"]];
    [self.navigationController pushViewController:desk animated:YES];
    
}

- (void)showDatePicker{
    self.view.userInteractionEnabled = NO;
    [self.dateTF becomeFirstResponder];
}

- (void)selectedDateAction:(UIButton *)btn
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"M月d日统计";
    [dateButton setTitle:[formatter stringFromDate:self.datePicker.date] forState:UIControlStateNormal];
    
    self.view.userInteractionEnabled = YES;
    [self.dateTF resignFirstResponder];
    
}

- (void)datePickerCancelTouched:(UIButton *)btn
{
    [self.dateTF resignFirstResponder];
    self.view.userInteractionEnabled = YES;
}


- (void)deleteAction{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"您确定要删除当天的数据吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == [alertView cancelButtonIndex]) {
        return;
    }
    
    if (alertView.tag == 1000) {
        //退出登录
        PGLoginViewController *loginVC = [[PGLoginViewController alloc]init];
        UINavigationController *loginNavi = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self.navigationController presentViewController:loginNavi animated:NO completion:nil];
        
    }else{
        
        [SVProgressHUD show];
        
        WS(weakSelf);
        [[PGApiClient sharedManage] pgSystemSafeCleanWithblock:^(id response, BOOL isError, NSString *errorMessage) {
            
            if (isError) {
                [SVProgressHUD showErrorWithStatus:errorMessage];
                 [weakSelf netWorking];
            }else{
                [SVProgressHUD showInfoWithStatus:@"删除成功"];
                [weakSelf netWorking];
            }
            
        }];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//退出登录
- (void)exitLogin{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您确定要退出登录吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.tag = 1000;
    [alertView show];
}


#pragma  mark -自动填充框架

//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
//    return [UIImage imageNamed:@"3-1"];
//}
//
//- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
//{
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
//
//    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
//
//    animation.duration = 0.25;
//    animation.cumulative = YES;
//    animation.repeatCount = MAXFLOAT;
//
//    return animation;
//}


- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂无数据，请稍后查看噢!";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"您也可以点击下面的按钮重新加载";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
    
    return [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"button_image"];
}


- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}



- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    // Do something
}



- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView
{
    // Do something
    [self netWorking];
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
