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

@interface DringsTableViewController ()

@end

@implementation DringsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}



- (void)createUI{
    
    self.view.backgroundColor = QFGRAYCOLOR;
    
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
        cell = [[[NSBundle mainBundle]loadNibNamed:@"" owner:self options:nil]firstObject];
    }
    
    cell.dataSource = self.dataSource[indexPath.row];
    
    return cell;
}


-(NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        
        NSArray *nameArray = @[@"嘉士伯",@"皇家礼炮",@"伏特加",@"威士忌",@"茅台",@"五粮液",@"烈火玫瑰",@"苏打水",@"脉动"];
        
        for (int i = 0; i < [nameArray count]; i ++) {
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
            [tempDic setObject:nameArray[i] forKey:@"drinkName"];
            
            NSInteger number = rand() % 1000;
            [tempDic setObject:[NSNumber numberWithInteger:number] forKey:@"drinkNumber"];
            
            number = rand() % 200;
            [tempDic setObject:[NSNumber numberWithInteger:number] forKey:@"lossNumber"];
            
            number = rand() % 5500;
            [tempDic setObject:[NSNumber numberWithInteger:number] forKey:@"earnings"];
            
            [_dataSource addObject:tempDic];
            
        }
    }
    return _dataSource;
}

@end
