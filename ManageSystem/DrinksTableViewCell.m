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
    
    self.drinksNumberLb.backgroundColor = UIColorFromRGB(0x29C2FA);
    self.drinksNumberLb.textColor = [UIColor whiteColor];
    self.drinksNumberLb.clipsToBounds = YES;
    self.drinksNumberLb.layer.cornerRadius = 8.0;
    
    self.lossNumberLb.backgroundColor = UIColorFromRGB(0xFF9415);
    self.lossNumberLb.textColor = [UIColor whiteColor];
    self.lossNumberLb.clipsToBounds = YES;
    self.lossNumberLb.layer.cornerRadius = 8.0;
    
    self.earningsLb.backgroundColor = UIColorFromRGB(0xFF6460);
    self.earningsLb.textColor = [UIColor whiteColor];
    self.earningsLb.clipsToBounds = YES;
    self.earningsLb.layer.cornerRadius = 8.0;
    
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
    
    NSNumber *lossNumer = [self.dataSource objectforNotNullKey:@"payNum"];
    if (lossNumer) {
        self.lossNumberLb.text = [NSString stringWithFormat:@"%@瓶",lossNumer];
        
    }
    
    NSString *earnings = [[self.dataSource objectforNotNullKey:@"amount"]description];
    if (earnings) {
        self.earningsLb.text = [NSString stringWithFormat:@"%@元",earnings];
    }
    
}

@end
