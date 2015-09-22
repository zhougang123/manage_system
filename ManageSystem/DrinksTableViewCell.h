//
//  DrinksTableViewCell.h
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinksTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *drinkNameLb;

//已点(瓶)
@property (weak, nonatomic) IBOutlet UILabel *drinksNumberLb;

//已赔(瓶)
@property (weak, nonatomic) IBOutlet UILabel *lossNumberLb;

//营收(元)
@property (weak, nonatomic) IBOutlet UILabel *earningsLb;

@property(nonatomic,strong)NSDictionary *dataSource;

@end
