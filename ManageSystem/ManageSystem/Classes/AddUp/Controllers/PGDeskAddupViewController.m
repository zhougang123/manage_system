//
//  PGDeskAddupViewController.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGDeskAddupViewController.h"

#import "PGDeskDetialsCell.h"

@interface PGDeskAddupViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *addUpTableView;

@end

@implementation PGDeskAddupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = PG_BG_GREY;
    
    self.title = @"K13";
    
    self.tableView.delegate = self;
    
    self.tableView.rowHeight = kPGDeskDetialsCellHeight;
    
    self.tableView.dataSource = self;
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
    static NSString *headCellID = @"detialsCell";
    
    PGDeskDetialsCell *cell = (PGDeskDetialsCell *)[tableView dequeueReusableCellWithIdentifier:headCellID];
    if (cell == nil) {
        cell = [[PGDeskDetialsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headCellID];
    }
    return cell;
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
