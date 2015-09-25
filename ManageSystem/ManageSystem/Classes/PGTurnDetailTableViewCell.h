//
//  PGTurnDetailTableViewCell.h
//  ManageSystem
//
//  Created by RIMI on 15/9/24.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPGDeskAddupCellHeight (80 * BILI_WIDTH)

@interface PGTurnDetailTableViewCell : UITableViewCell

@property (nonatomic , strong) UIView *detailView;

@property (nonatomic , strong)NSDictionary *dataSource;


- (void)hiddenAllLabel;

- (CGFloat )getPGturnDetailTableViewCellHight:(NSDictionary *)dataSouce;

@end
