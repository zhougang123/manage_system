//
//  PGAddUpAllCell.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGAddUpAllCell.h"
#import "AppDelegate.h"


@interface PGAddUpAllCell ()

@property (nonatomic, strong) UILabel *incomeLabel;

@property (nonatomic, strong) UILabel *hasStartedLabel;

@property (nonatomic, strong) UILabel *hasGuessLabel;

@property (nonatomic, strong) UILabel *sumGlassLabel;


@end

@implementation PGAddUpAllCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *incomeTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 * BILI_WIDTH, SCREEN_WIDTH, 30 * BILI_WIDTH)];
        incomeTitle.textColor = [UIColor lightGrayColor];
        incomeTitle.textAlignment = NSTextAlignmentCenter;
        incomeTitle.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        incomeTitle.text = @"已营收:";
        
        self.incomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35 * BILI_WIDTH, SCREEN_WIDTH, kPGAddUpAllCellHeight - 35 * BILI_WIDTH - 80 * BILI_WIDTH)];
        self.incomeLabel.textColor = UIColorFromRGB(0xFD850A);
        self.incomeLabel.textAlignment = NSTextAlignmentCenter;
        self.incomeLabel.font = [UIFont systemFontOfSize:30 * BILI_WIDTH];
//        self.incomeLabel.text = @"123231234.00元";
        
        CGFloat width = SCREEN_WIDTH/3.0;
        CGFloat heightTitle = kPGAddUpAllCellHeight - 70 * BILI_WIDTH;
        CGFloat heightAddup = kPGAddUpAllCellHeight - 50 * BILI_WIDTH;
        
        UILabel *hasStartTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, heightTitle, width, 30 * BILI_WIDTH)];
        hasStartTitle.textColor = [UIColor lightGrayColor];
        hasStartTitle.textAlignment = NSTextAlignmentCenter;
        hasStartTitle.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        hasStartTitle.text = @"已进行";
        
        UILabel *hasGuessTitle = [[UILabel alloc] initWithFrame:CGRectMake(width, heightTitle, width, 30 * BILI_WIDTH)];
        hasGuessTitle.textColor = [UIColor lightGrayColor];
        hasGuessTitle.textAlignment = NSTextAlignmentCenter;
        hasGuessTitle.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        hasGuessTitle.text = @"已竞猜";
        
        UILabel *sumGlassTitle = [[UILabel alloc] initWithFrame:CGRectMake(width * 2, heightTitle, width, 30 * BILI_WIDTH)];
        sumGlassTitle.textColor = [UIColor lightGrayColor];
        sumGlassTitle.textAlignment = NSTextAlignmentCenter;
        sumGlassTitle.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        sumGlassTitle.text = @"点酒水";
        
        self.hasStartedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, heightAddup, width, 50 * BILI_WIDTH)];
        self.hasStartedLabel.textColor = [UIColor blackColor];
        self.hasStartedLabel.textAlignment = NSTextAlignmentCenter;
        self.hasStartedLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
//        self.hasStartedLabel.text = @"8 轮";
        
        self.hasGuessLabel = [[UILabel alloc] initWithFrame:CGRectMake(width, heightAddup, width, 50 * BILI_WIDTH)];
        self.hasGuessLabel.textColor = [UIColor blackColor];
        self.hasGuessLabel.textAlignment = NSTextAlignmentCenter;
        self.hasGuessLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
//        self.hasGuessLabel.text = @"32 次";
        
        self.sumGlassLabel = [[UILabel alloc] initWithFrame:CGRectMake(width * 2, heightAddup, width, 50 * BILI_WIDTH)];
        self.sumGlassLabel.textColor = [UIColor blackColor];
        self.sumGlassLabel.textAlignment = NSTextAlignmentCenter;
        self.sumGlassLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
//        self.sumGlassLabel.text = @"986 瓶";
        
        UIView *greyVLine1 = [[UIView alloc] initWithFrame:CGRectMake(width, heightTitle + 10 * BILI_WIDTH, 0.5, 80 * BILI_WIDTH - 30 * BILI_WIDTH)];
        greyVLine1.backgroundColor = [UIColor lightGrayColor];
        
        UIView *greyVLine2 = [[UIView alloc] initWithFrame:CGRectMake(width * 2, heightTitle + 10 * BILI_WIDTH, 0.5, 80 * BILI_WIDTH - 30 * BILI_WIDTH)];
        greyVLine2.backgroundColor = [UIColor lightGrayColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton *roundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        roundButton.frame = CGRectMake(0, kPGAddUpAllCellHeight - 80 * BILI_WIDTH, width, 80 * BILI_WIDTH);
        roundButton.backgroundColor = [UIColor clearColor];
        [roundButton addTarget:self action:@selector(showRundAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *glassButton = [UIButton buttonWithType:UIButtonTypeCustom];
        glassButton.frame = CGRectMake(width * 2, kPGAddUpAllCellHeight - 80 * BILI_WIDTH, width, 80 * BILI_WIDTH);
        glassButton.backgroundColor = [UIColor clearColor];
        [glassButton addTarget:self action:@selector(showGlassAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:incomeTitle];
        [self.contentView addSubview:hasStartTitle];
        [self.contentView addSubview:hasGuessTitle];
        [self.contentView addSubview:sumGlassTitle];
        [self.contentView addSubview:self.incomeLabel];
        [self.contentView addSubview:self.hasStartedLabel];
        [self.contentView addSubview:self.hasGuessLabel];
        [self.contentView addSubview:self.sumGlassLabel];
        
        [self.contentView addSubview:greyVLine1];
        [self.contentView addSubview:greyVLine2];
        [self.contentView addSubview:roundButton];
        [self.contentView addSubview:glassButton];
    }
    return self;
    
}

- (void)showRundAction:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(turnButtonAction)]) {
        [self.delegate turnButtonAction];
    }
}
- (void)showGlassAction:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(drinksButtonAction)]) {
        [self.delegate drinksButtonAction];
    }
}



- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (!self.dataSource ||[self.dataSource allKeys]==0 ) {
        return;
    }
    
//    if (![[self.dataSource objectforNotNullKey:@"drinkNum"] isKindOfClass:[NSNull class]]) {
    
        self.sumGlassLabel.text = [NSString stringWithFormat:@"%@瓶",[self.dataSource objectforNotNullKey:@"drinkNum"]];
//    }else{
//        self.sumGlassLabel.text = @"0 瓶";
//    }
    
    if (![[self.dataSource objectForKey:@"amount"] isKindOfClass:[NSNull class]]) {
        self.incomeLabel.text = [NSString stringWithFormat:@"%0.0f元",[[self.dataSource objectforNotNullKey:@"amount"] floatValue]  ];
    }else{
        self.incomeLabel.text = @"0元";
    }
    
    if (![[self.dataSource objectForKey:@"roundNum"] isKindOfClass:[NSNull class]]) {
        self.hasStartedLabel.text =  [NSString stringWithFormat:@"%@ 轮",[self.dataSource objectforNotNullKey:@"roundNum"]];
    }else{
        self.hasStartedLabel.text = @"0 轮";
    }
    
    if (![[self.dataSource objectForKey:@"orderNum"] isKindOfClass:[NSNull class]]) {
        self.hasGuessLabel.text = [NSString stringWithFormat:@"%@ 次",[self.dataSource objectforNotNullKey:@"orderNum"]];
    }else{
        self.hasGuessLabel.text = @"0 次";
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
