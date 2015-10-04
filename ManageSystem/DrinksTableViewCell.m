//
//  DrinksTableViewCell.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "DrinksTableViewCell.h"

@implementation DrinksTableViewCell{
    
    __weak IBOutlet UILabel *yipeiLabel;
    
    __weak IBOutlet UILabel *yidianLabel;
    
    __weak IBOutlet UILabel *yingshouLabel;
}

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
    
    NSString *drinkNmae = [self.dataSource objectforNotNullKey:@"name"];
    if (drinkNmae) {
        self.drinkNameLb.text = drinkNmae;
    }
    
    NSString *drinkNum = [[self.dataSource objectforNotNullKey:@"buyNum"] description];
    if (drinkNum) {
        self.drinksNumberLb.text = [NSString stringWithFormat:@"%@瓶",drinkNum];
    }
    
    NSString *lossNumer = [self.dataSource objectforNotNullKey:@"lossNumber"];
    if (lossNumer) {
#warning 少一个已赔瓶数
        
    }
    
    NSString *earnings = [[self.dataSource objectforNotNullKey:@"amount"]description];
    if (earnings) {
        self.earningsLb.text = [NSString stringWithFormat:@"%@.00元",earnings];
    }
    
}

@end
