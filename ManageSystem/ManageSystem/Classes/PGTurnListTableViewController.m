//
//  PGTurnListTableViewController.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGTurnListTableViewController.h"
#import "PGTurnListTableViewCell.h"
#import "PGTurnDetailTableViewController.h"

@interface PGTurnListTableViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@implementation PGTurnListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self netWorking];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)createUI{
    self.title = @"每轮统计";
    self.view.backgroundColor = UIColorFromRGB(0xECECEF);
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    WS(weakself);
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself netWorking];
    }];

}

- (void)netWorking{
    
    WS(weakself);
    [SVProgressHUD show];
    [[PGApiClient sharedManage] checkPGSystemAllRoundWithDate:nil block:^(id response, BOOL isError, NSString *errorMessage) {
        [SVProgressHUD dismiss];
        [self.tableView.header endRefreshing];
        if (isError) {
            [SVProgressHUD showErrorWithStatus:errorMessage];
        }else{
            
            weakself.dataSource = response;
            [self.tableView reloadData];
        }
        
    }];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PGTurnListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TurnCell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PGTurnListTableViewCell" owner:self options:nil]firstObject];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.dataSource = self.dataSource[indexPath.row];
    
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90.0f;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PGTurnDetailTableViewController *detailVC = [[PGTurnDetailTableViewController alloc]init];
    
    NSDictionary *dataSource = self.dataSource[indexPath.row];
    
    NSString *turnInfo = [dataSource objectforNotNullKey:@"number"];
    detailVC.roundID = turnInfo;
    turnInfo = [NSString stringWithFormat:@"第%@轮",turnInfo];
    
    NSString *gameResult = [NSString stringWithFormat:@"(%@, %@)",[dataSource objectforNotNullKey:@"resultFirst"],[dataSource objectforNotNullKey:@"resultSecond"]];
    
    detailVC.title = [NSString stringWithFormat:@"%@%@",turnInfo,gameResult];
    
    [self.navigationController pushViewController:detailVC animated:YES];
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


//
//- (NSMutableArray *)dataSource{
//    if (!_dataSource) {
//        _dataSource = [NSMutableArray array];
//        
//        for (int i = 1 ; i < 9; i ++) {
//            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
//            //每轮信息
//            [tempDic setObject:[NSNumber numberWithInt:i] forKey:@"turnInfo"];
//            //每轮时间
//            NSTimeInterval interval = random() % 14000000;
//            NSDate *date = [NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]];
//            [tempDic setValue:date forKey:@"time"];
//            //游戏结果
//            int resultOne = rand() % 6 +1;
//            int resultTow = rand() % 6 +1;
//            NSString *gameResult = [NSString stringWithFormat:@"(%d, %d)",resultOne,resultTow];
//            [tempDic setValue:gameResult forKey:@"gameResult"];
//            //酒水数量
//            resultOne = rand() % 1000;
//            [tempDic setValue:[NSNumber numberWithInt:resultOne] forKey:@"drinkNumber"];
//            //营收额
//            resultOne = rand() % 10000;
//            [tempDic setValue:[NSNumber numberWithInt:resultOne] forKey:@"earnings"];
//            
//            [_dataSource addObject:tempDic];
//        }
//        
//        _dataSource = (NSMutableArray *)[[_dataSource reverseObjectEnumerator] allObjects];
//    }
//    
//    return _dataSource;
//}


@end
