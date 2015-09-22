//
//  PGTurnDetailTableViewCell.m
//  ManageSystem
//
//  Created by RIMI on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGTurnDetailTableViewCell.h"

@implementation PGTurnDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.detailView.layer.borderWidth = 1.20f;
    self.detailView.layer.borderColor = (__bridge CGColorRef)([UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1]);
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
    self.detailView.layer.borderWidth = 1.20f;
    self.detailView.layer.borderColor = (__bridge CGColorRef)([UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1]);
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
