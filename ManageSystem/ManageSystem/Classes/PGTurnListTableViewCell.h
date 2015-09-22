//
//  PGTurnListTableViewCell.h
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGTurnListTableViewCell : UITableViewCell

//第几轮
@property (weak, nonatomic) IBOutlet UILabel *turnInfoLb;


//09:22 20:18 时间
@property (weak, nonatomic) IBOutlet UILabel *timeLb;


//游戏结果
@property (weak, nonatomic) IBOutlet UILabel *gameResultLb;



//当轮酒水 (瓶)
@property (weak, nonatomic) IBOutlet UILabel *drinksNumLb;


//收益(元)
@property (weak, nonatomic) IBOutlet UILabel *earningsLb;


@property (nonatomic,strong)NSDictionary *dataSource;

@end
