//
//  PGAddUpAllCell.h
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPGAddUpAllCellHeight (180 * BILI_WIDTH)

@protocol PGAddUpAllCellDelegate <NSObject>

- (void)turnButtonAction;

- (void)drinksButtonAction;

@end

@interface PGAddUpAllCell : UITableViewCell

@property (nonatomic,weak) id<PGAddUpAllCellDelegate>delegate;
@property (nonatomic,strong)NSDictionary* dataSource;
@end
