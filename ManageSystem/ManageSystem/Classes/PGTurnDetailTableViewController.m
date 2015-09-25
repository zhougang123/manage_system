//
//  PGTurnDetailTableViewController.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGTurnDetailTableViewController.h"
#import "PGTurnDetailTableViewCell.h"

@interface PGTurnDetailTableViewController ()

@end

@implementation PGTurnDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)createUI{
   
    self.view.backgroundColor = UIColorFromRGB(0xdddddd);
    self.tableView.tableFooterView = [[UIView alloc]init];
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
    cell.dataSource = self.dataSource[indexPath.row];
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


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
         NSArray *nameArray = @[@"嘉士伯",@"皇家礼炮",@"伏特加",@"威士忌",@"茅台",@"五粮液",@"烈火玫瑰",@"苏打水",@"脉动"];
        NSArray *resuletArray = @[@"大 (8点-12点)",@"和 (7点)",@"小 (2点-6点)",@"2点",@"3点",@"4点",@"5点",@"对子 (2+2)",@"对子 (3+3)",@"对子 (4+4)",@"12点",@"4 + 3",@" 5 +2 ",@"对子 (5+5)",@"9点",@"6点"];
  
        for (int i = 0 ; i <rand() % 15+1; i ++) {
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
            //桌号
            NSNumber *deskNumber = [NSNumber numberWithInt:i +1];
            NSString *deskNum = [NSString stringWithFormat:@"K%@",deskNumber];
            [tempDic setObject:deskNum forKey:@"deskNumber"];
            
            int randomNumber = random() % 5000;
            //收益
            NSNumber *earnings = [NSNumber numberWithInt:randomNumber];
            [tempDic setObject:earnings forKey:@"earnings"];
            //时间
            randomNumber = rand() % 130234554;
            NSDate *date = [NSDate dateWithTimeInterval:randomNumber sinceDate:[NSDate date]];
            [tempDic setObject:date forKey:@"time"];
            
            NSMutableArray *contentArray = [NSMutableArray array];
            
            for (int i = 0 ; i < random() % 15 + 1; i ++) {
                NSMutableDictionary *contentDic = [NSMutableDictionary dictionary];
                [contentDic setObject:nameArray[random()%[nameArray count]] forKey:@"drinksName"];
                [contentDic setObject:resuletArray[random()%[resuletArray count]] forKey:@"gameResult"];
                [contentDic setObject:@"1: 18" forKey:@"bili"];
                [contentDic setObject:[NSNumber numberWithInt:random() % 120] forKey:@"drinksNumber"];
                [contentArray addObject:contentDic];
                
            }
            [tempDic setObject:contentArray forKey:@"content"];
            
            [_dataSource addObject:tempDic];
            

        }
    
        
    }
    
    return _dataSource;
}

@end
