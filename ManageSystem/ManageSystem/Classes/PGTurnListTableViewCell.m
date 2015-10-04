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
    
    if (!self.dataSource || [self.dataSource isKindOfClass:[NSNull class]]) {
        return;
    }
    
    self.turnInfoLb.text = [NSString stringWithFormat:@"第%@轮",[self.dataSource objectforNotNullKey:@"number"]];
    
    NSString *date = [self.dataSource objectForKey:@"date"];
    if (date) {
        NSMutableArray* stringArr = [[date componentsSeparatedByString:@"-"] mutableCopy];
        [stringArr removeObjectAtIndex:0];
        date = [NSString stringWithFormat:@"%@-%@",stringArr[0],stringArr[1]];
        self.timeLb.text = date;
    }
    
    
    
    NSString *result = [NSString stringWithFormat:@"(%@, %@)",[self.dataSource objectforNotNullKey:@"resultFirst"],[self.dataSource objectforNotNullKey:@"resultSecond"]];
    
    self.gameResultLb.text =result;
    
    
    NSString *drinkNumber = [self.dataSource objectforNotNullKey:@"drinkNum"];
    if (drinkNumber) {
        self.drinksNumLb.text = [NSString stringWithFormat:@"%@瓶",drinkNumber];
    }
    
    NSString *earnings = [self.dataSource objectforNotNullKey:@"amount"];
    if (earnings) {
        self.earningsLb.text = [NSString stringWithFormat:@"%@.00元",earnings];
    }
    
    
}


@end
