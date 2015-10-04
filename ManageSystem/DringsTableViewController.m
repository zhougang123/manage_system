//
//  DringsTableViewController.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "DringsTableViewController.h"
#import "DrinksTableViewCell.h"

#define QFGRAYCOLOR  [UIColor colorWithRed:103/255.0 green:109/255.0 blue:114/255.0 alpha:1]

@interface DringsTableViewController ()<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@end

@implementation DringsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self netWorking];
    
}



- (void)createUI{
    
    self.view.backgroundColor = UIColorFromRGB(0xECECEF);
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.title = @"酒水统计";
}

- (void)netWorking{
    
    WS(weakself);
    
    [SVProgressHUD show];
    [[PGApiClient sharedManage] checkPGSystemAllDrinkWithDate:nil block:^(id response, BOOL isError, NSString *errorMessage) {
        
        if (isError) {
            [SVProgressHUD showErrorWithStatus:errorMessage];
        }else{
            [SVProgressHUD dismiss];
            weakself.dataSource = response;
            [self.tableView reloadData];
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DrinksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DrinkCell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DrinksTableViewCell" owner:self options:nil]firstObject];
    }
    
    cell.dataSource = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  80.0f;
}


#pragma  mark -自动填充框架

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"3-1"];
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}


- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"酒水统计页面空空的";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂时没有数据哦，请稍后再来看看吧，您也可以点击下面的按钮来重新加载数据！";
    
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

//-(NSArray *)dataSource{
//    if (!_dataSource) {
//        _dataSource = [NSMutableArray array];
//        
//        NSArray *nameArray = @[@"嘉士伯",@"皇家礼炮",@"伏特加",@"威士忌",@"茅台",@"五粮液",@"烈火玫瑰",@"苏打水",@"脉动"];
//        
//        for (int i = 0; i < [nameArray count]; i ++) {
//            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
//            [tempDic setObject:nameArray[i] forKey:@"drinkName"];
//            
//            NSInteger number = rand() % 1000;
//            [tempDic setObject:[NSNumber numberWithInteger:number] forKey:@"drinkNumber"];
//            
//            number = rand() % 60;
//            [tempDic setObject:[NSNumber numberWithInteger:number] forKey:@"lossNumber"];
//            
//            number = rand() % 5500;
//            [tempDic setObject:[NSNumber numberWithInteger:number] forKey:@"earnings"];
//            
//            [_dataSource addObject:tempDic];
//            
//        }
//    }
//    return _dataSource;
//}



@end
