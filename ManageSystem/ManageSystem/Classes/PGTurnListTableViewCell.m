//
//  PGTurnListTableViewCell.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGTurnListTableViewCell.h"

@implementation PGTurnListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (!self.dataSource || [self.dataSource isEqual:[NSNull class]]) {
        return;
    }
    
    NSString *turnInfo = [self.dataSource objectForKey:@"turnInfo"];
    if (turnInfo) {
        self.turnInfoLb.text = [NSString stringWithFormat:@"第%@轮",turnInfo];
    }
    
    NSDate *date = [self.dataSource objectForKey:@"time"];
    if (date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM:dd hh:mm"];
        self.timeLb.text = [formatter stringFromDate:date];
    }
    
    NSString *gameResult = [self.dataSource objectForKey:@"gameResult"];
    if (gameResult) {
        self.gameResultLb.text =gameResult;
    }
    
    NSString *drinkNumber = [self.dataSource objectForKey:@"drinkNumber"];
    if (drinkNumber) {
        self.drinksNumLb.text = [NSString stringWithFormat:@"%@瓶",drinkNumber];
    }
    
    NSString *earnings = [self.dataSource objectForKey:@"earnings"];
    if (earnings) {
        self.earningsLb.text = [NSString stringWithFormat:@"%@.00元",earnings];
    }
    
    
}


@end
