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
   
    self.view.backgroundColor = [UIColor lightGrayColor];
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PGTurnDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TurnDetailCell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PGTurnDetailTableViewCell" owner:self options:nil]firstObject];
    }
    
    
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 130.0f;
}


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i = 0 ; i <20; i ++) {
            [_dataSource addObject:[NSNumber numberWithInt:i]];
        }
        
    }
    
    return _dataSource;
}

@end
