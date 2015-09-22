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

@property (nonatomic, strong) UITableView *addUpTableView;

@end

@implementation PGAddUpWithDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawTableView];
}

- (void)drawTableView
{
    self.addUpTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    self.addUpTableView.delegate = self;
    self.addUpTableView.dataSource = self;
    self.addUpTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    self.addUpTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.addUpTableView.tableFooterView.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.addUpTableView];
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
            PGDeskAddupCell *deskCell = (PGDeskAddupCell *)[tableView dequeueReusableCellWithIdentifier:headCellID];
            if (deskCell == nil) {
                deskCell = [[PGDeskAddupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:deskCellID];
            }
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
