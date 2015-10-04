//
//  PGTurnDetailTableViewController.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGTurnDetailTableViewController.h"
#import "PGTurnDetailTableViewCell.h"

@interface PGTurnDetailTableViewController ()<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@end

@implementation PGTurnDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self netWorking];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)netWorking{
    
    [SVProgressHUD show];
    
    WS(weakself);
    [[PGApiClient sharedManage] checkPGSystemRoundDeskWithDate:self.roundID block:^(id response, BOOL isError, NSString *errorMessage) {
       
        [self.tableView.header endRefreshing];
        if (isError) {
            [SVProgressHUD showErrorWithStatus:errorMessage];
        }else{
            [SVProgressHUD dismiss];
            weakself.dataSource = [response mutableCopy];
            NSMutableArray *indexArray = [NSMutableArray array];
            [weakself.dataSource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                NSArray *detailArray = [obj objectForKey:@"orderDetailVoList"];
                if (detailArray.count<=0) {
                    [indexArray addObject:[NSNumber numberWithInteger:idx]];
                }
            }];
            
            for (NSNumber *idx in indexArray) {
                [weakself.dataSource removeObjectAtIndex:[idx integerValue]];
            }
            
            [weakself.tableView reloadData];
        }
        
    }];
}


- (void)createUI{
   
    self.view.backgroundColor = UIColorFromRGB(0xdddddd);
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.emptyDataSetSource = self;
    
    WS(weakself);
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakself netWorking];
    }];
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PGTurnDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TurnDetailCell"];
    
    if (!cell) {
        cell = [[PGTurnDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TurnDetailCell"];
    }
    
    [cell hiddenAllLabel];
    NSDictionary *detailDic = self.dataSource[indexPath.row];
    
    cell.dataSource = detailDic;
    
    CGRect frame = cell.frame;
    frame.size.height = [cell getPGturnDetailTableViewCellHight:self.dataSource[indexPath.row]];
    cell.frame = frame;
    
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PGTurnDetailTableViewCell *cell = (PGTurnDetailTableViewCell *) [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
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
    NSString *text = @"页面空空如也";
    
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


//- (NSMutableArray *)dataSource{
//    if (!_dataSource) {
//        _dataSource = [NSMutableArray array];
//         NSArray *nameArray = @[@"嘉士伯",@"皇家礼炮",@"伏特加",@"威士忌",@"茅台",@"五粮液",@"烈火玫瑰",@"苏打水",@"脉动"];
//        NSArray *resuletArray = @[@"大 (8点-12点)",@"和 (7点)",@"小 (2点-6点)",@"2点",@"3点",@"4点",@"5点",@"对子 (2+2)",@"对子 (3+3)",@"对子 (4+4)",@"12点",@"4 + 3",@" 5 +2 ",@"对子 (5+5)",@"9点",@"6点"];
//  
//        for (int i = 0 ; i <rand() % 15+1; i ++) {
//            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
//            //桌号
//            NSNumber *deskNumber = [NSNumber numberWithInt:i +1];
//            NSString *deskNum = [NSString stringWithFormat:@"K%@",deskNumber];
//            [tempDic setObject:deskNum forKey:@"deskNumber"];
//            
//            int randomNumber = random() % 5000;
//            //收益
//            NSNumber *earnings = [NSNumber numberWithInt:randomNumber];
//            [tempDic setObject:earnings forKey:@"earnings"];
//            //时间
//            randomNumber = rand() % 130234554;
//            NSDate *date = [NSDate dateWithTimeInterval:randomNumber sinceDate:[NSDate date]];
//            [tempDic setObject:date forKey:@"time"];
//            
//            NSMutableArray *contentArray = [NSMutableArray array];
//            
//            for (int i = 0 ; i < random() % 15 + 1; i ++) {
//                NSMutableDictionary *contentDic = [NSMutableDictionary dictionary];
//                [contentDic setObject:nameArray[random()%[nameArray count]] forKey:@"drinksName"];
//                [contentDic setObject:resuletArray[random()%[resuletArray count]] forKey:@"gameResult"];
//                [contentDic setObject:@"1: 18" forKey:@"bili"];
//                [contentDic setObject:[NSNumber numberWithInt:random() % 120] forKey:@"drinksNumber"];
//                [contentArray addObject:contentDic];
//                
//            }
//            [tempDic setObject:contentArray forKey:@"content"];
//            
//            [_dataSource addObject:tempDic];
//            
//
//        }
//    
//        
//    }
//    
//    return _dataSource;
//}

@end
