//
//  PGDeskDetialsCell.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGDeskDetialsCell.h"
#import "PGCustomView.h"


#define kBaseTag 10000;



@interface PGDeskDetialsCell ()

@property (nonatomic, strong) UILabel *roundTimeLabel;
@property (nonatomic, strong) UILabel *incomeLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *guessLargeSmall;
@property (nonatomic, strong) UILabel *guessPointLabel;
@property (nonatomic, strong) UILabel *guessTwoPoint;

@property (nonatomic, strong) PGCustomView *containerView;
@property (nonatomic, strong) UIView *greyLine;

@end

@implementation PGDeskDetialsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.roundTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * BILI_WIDTH, 0, SCREEN_WIDTH - 30 * BILI_WIDTH, kOneLineHeight)];
        self.roundTimeLabel.textColor = [UIColor blackColor];
        self.roundTimeLabel.textAlignment = NSTextAlignmentLeft;
        self.roundTimeLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        self.roundTimeLabel.text = @"第5轮(5, 3)";
        
        
        self.incomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * BILI_WIDTH, 0, SCREEN_WIDTH - 30 * BILI_WIDTH, kOneLineHeight)];
        self.incomeLabel.textColor = UIColorFromRGB(0xFD850A);
        self.incomeLabel.textAlignment = NSTextAlignmentRight;
        self.incomeLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        self.incomeLabel.text = @"234523:00元";
        
        self.containerView = [[PGCustomView alloc] initWithFrame:CGRectZero];


        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * BILI_WIDTH, CGRectGetMaxY(self.incomeLabel.frame), SCREEN_WIDTH - 30 * BILI_WIDTH, kOneLineHeight)];
        self.dateLabel.textColor = [UIColor lightGrayColor];
        self.dateLabel.textAlignment = NSTextAlignmentRight;
        self.dateLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        self.dateLabel.text = @"2015年8月30日 9:30";
        
        
        self.greyLine = [[UIView alloc] initWithFrame:CGRectMake(0, kOneLineHeight - 0.5, SCREEN_WIDTH, 0.5)];
        self.greyLine.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:self.roundTimeLabel];
        [self.contentView addSubview:self.incomeLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.containerView];
        [self.contentView addSubview:self.greyLine];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
    
}

- (void)drawTableCellWithDetials:(NSArray *)detials
{
    self.containerView.frame = CGRectMake(10 * BILI_WIDTH, kOneLineHeight, SCREEN_WIDTH - 20 *BILI_WIDTH, kOneLineHeight * [detials count]);
    self.dateLabel.frame = CGRectMake(10 * BILI_WIDTH, CGRectGetMaxY(self.containerView.frame), SCREEN_WIDTH - 20 * BILI_WIDTH , kOneLineHeight);
    self.greyLine.frame = CGRectMake(0, kOneLineHeight * 2 + CGRectGetHeight(self.containerView.frame) - 0.5, SCREEN_WIDTH, 0.5);
    self.containerView.detialsArray = detials;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
