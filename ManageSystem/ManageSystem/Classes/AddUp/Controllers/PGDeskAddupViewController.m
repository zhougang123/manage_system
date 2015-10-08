//
//  PGDeskAddupViewController.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGDeskAddupViewController.h"

#import "PGDeskDetialsCell.h"

@interface PGDeskAddupViewController ()<UITableViewDataSource, UITableViewDelegate,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@property (nonatomic, strong) UITableView *addUpTableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation PGDeskAddupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = PG_BG_GREY;
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.view.backgroundColor = UIColorFromRGB(0xECECEF);
    
    [self netWorking];
    WS(weakself);
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakself netWorking];
    }];
}

- (void)netWorking{
    
    [SVProgressHUD show];
    WS(weakself);
    [[PGApiClient sharedManage] checkPGSystemDeskRoundWithDate:self.deskID block:^(id response, BOOL isError, NSString *errorMessage) {
        
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
                    [indexArray addObject:obj];
                }
            }];
            
            for (id obj in indexArray) {
                [weakself.dataSource removeObject:obj];
            }
            
            [weakself.tableView reloadData];
        }
        
    }];
}


#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *headCellID = @"detialsCell";
    
    PGDeskDetialsCell *cell = (PGDeskDetialsCell *)[tableView dequeueReusableCellWithIdentifier:headCellID];
    if (cell == nil) {
        cell = [[PGDeskDetialsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headCellID];
    }
    cell.dataSource = self.dataSource[indexPath.row];
    NSDictionary *detailDic = self.dataSource[indexPath.row];
    
    [cell drawTableCellWithDetials:[detailDic objectForKey:@"orderDetailVoList"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return ([self.dataSource[indexPath.row] count] + 2)* kOneLineHeight ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSString *text = @"您也可以点击文字重新加载";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


//- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
//{
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
//    
//    return [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
//}
//
//- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
//{
//    return [UIImage imageNamed:@"button_image"];
//}


- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}



- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    // Do something
    [self netWorking];
}



//- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView
//{
//    // Do something
//    [self netWorking];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
