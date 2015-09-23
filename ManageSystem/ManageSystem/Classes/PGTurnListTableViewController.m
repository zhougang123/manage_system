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

@interface PGTurnListTableViewController ()

@end

@implementation PGTurnListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createUI{
    self.title = @"每轮统计";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
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
    
    NSString *turnInfo = [dataSource objectForKey:@"turnInfo"];
    turnInfo = [NSString stringWithFormat:@"第%@轮",turnInfo];
    
    NSString *gameResult = [dataSource objectForKey:@"gameResult"];
    
    detailVC.title = [NSString stringWithFormat:@"%@%@",turnInfo,gameResult];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        
        for (int i = 1 ; i < 9; i ++) {
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
            //每轮信息
            [tempDic setObject:[NSNumber numberWithInt:i] forKey:@"turnInfo"];
            //每轮时间
            NSTimeInterval interval = random() % 14000000;
            NSDate *date = [NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]];
            [tempDic setValue:date forKey:@"time"];
            //游戏结果
            int resultOne = rand() % 6 +1;
            int resultTow = rand() % 6 +1;
            NSString *gameResult = [NSString stringWithFormat:@"(%d, %d)",resultOne,resultTow];
            [tempDic setValue:gameResult forKey:@"gameResult"];
            //酒水数量
            resultOne = rand() % 1000;
            [tempDic setValue:[NSNumber numberWithInt:resultOne] forKey:@"drinkNumber"];
            //营收额
            resultOne = rand() % 10000;
            [tempDic setValue:[NSNumber numberWithInt:resultOne] forKey:@"earnings"];
            
            [_dataSource addObject:tempDic];
        }
        
        _dataSource = (NSMutableArray *)[[_dataSource reverseObjectEnumerator] allObjects];
    }
    
    return _dataSource;
}


@end
