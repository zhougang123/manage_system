//
//  DrinksTableViewCell.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "DrinksTableViewCell.h"

@implementation DrinksTableViewCell

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
    
    NSString *drinkNmae = [self.dataSource objectForKey:@"drinkName"];
    if (drinkNmae) {
        self.drinkNameLb.text = drinkNmae;
    }
    
    NSString *drinkNum = [self.dataSource objectForKey:@"drinkNumber"];
    if (drinkNum) {
        self.drinksNumberLb.text = [NSString stringWithFormat:@"%@瓶",drinkNum];
    }
    
    NSString *lossNumer = [self.dataSource objectForKey:@"lossNumber"];
    if (lossNumer) {
        self.lossNumberLb.text = [NSString stringWithFormat:@"%@瓶",lossNumer];
    }
    
    NSString *earnings = [self.dataSource objectForKey:@"earnings"];
    if (earnings) {
        self.earningsLb.text = [NSString stringWithFormat:@"%@元",earnings];
    }
    
}

@end
