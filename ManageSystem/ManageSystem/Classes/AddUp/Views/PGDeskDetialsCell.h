//
//  PGDeskDetialsCell.h
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PGCustomView.h"

@interface PGDeskDetialsCell : UITableViewCell

@property (nonatomic ,strong)NSDictionary *dataSource;

- (void)drawTableCellWithDetials:(NSArray *)detials;

@end
