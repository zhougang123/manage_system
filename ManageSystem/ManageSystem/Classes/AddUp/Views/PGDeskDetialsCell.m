//
//  PGDeskDetialsCell.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGDeskDetialsCell.h"

#define kBaseTag 10000;



@interface PGDeskDetialsCell ()

@property (nonatomic, strong) UILabel *roundTimeLabel;
@property (nonatomic, strong) UILabel *incomeLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *guessLargeSmall;
@property (nonatomic, strong) UILabel *guessPointLabel;
@property (nonatomic, strong) UILabel *guessTwoPoint;

@property (nonatomic, strong) UIView *containerView;

@end

@implementation PGDeskDetialsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.roundTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * BILI_WIDTH, 0, SCREEN_WIDTH - 30 * BILI_WIDTH, kPGDeskDetialsCellHeight/5.0)];
        self.roundTimeLabel.textColor = [UIColor blackColor];
        self.roundTimeLabel.textAlignment = NSTextAlignmentLeft;
        self.roundTimeLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        self.roundTimeLabel.text = @"第5轮(5, 3)";
        
        
        self.incomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * BILI_WIDTH, 0, SCREEN_WIDTH - 30 * BILI_WIDTH, kPGDeskDetialsCellHeight/5.0)];
        self.incomeLabel.textColor = UIColorFromRGB(0xFD850A);
        self.incomeLabel.textAlignment = NSTextAlignmentRight;
        self.incomeLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        self.incomeLabel.text = @"234523:00元";
        
        self.containerView = [[UIView alloc] initWithFrame:CGRectMake(10 *BILI_WIDTH, kPGDeskDetialsCellHeight/5.0, SCREEN_WIDTH - 20 *BILI_WIDTH, (kPGDeskDetialsCellHeight/5.0) * 3.0 )];
        self.containerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.containerView.layer.borderWidth = 0.5;
        
        CGFloat width = CGRectGetWidth(self.containerView.frame)/4.0;
        
        int labTag = kBaseTag;
        for (int i = 0; i < 3 ; i++) {
            for (int j = 0; j < 4; j++) {
                
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width*j, (kPGDeskDetialsCellHeight/5.0) * i, width, kPGDeskDetialsCellHeight/5.0)];
                label.textColor = [UIColor blackColor];
                label.tag = labTag;
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
                label.text = @"第5轮(5, 3)";
                [self.containerView addSubview:label];
                
                labTag++;
            }
        }
        

        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * BILI_WIDTH, 4*(kPGDeskDetialsCellHeight/5.0), SCREEN_WIDTH - 30 * BILI_WIDTH, kPGDeskDetialsCellHeight/5.0)];
        self.dateLabel.textColor = [UIColor lightGrayColor];
        self.dateLabel.textAlignment = NSTextAlignmentRight;
        self.dateLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        self.dateLabel.text = @"2015年8月30日 9:30";
        
        
        UIView *greyLine = [[UIView alloc] initWithFrame:CGRectMake(0, kPGDeskDetialsCellHeight - 0.5, SCREEN_WIDTH, 0.5)];
        greyLine.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:self.roundTimeLabel];
        [self.contentView addSubview:self.incomeLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.containerView];
        [self.contentView addSubview:greyLine];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
    
}

- (void)drawTableCell
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
