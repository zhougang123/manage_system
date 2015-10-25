//
//  PGRoundAddupCell.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGDeskAddupCell.h"

@interface PGDeskAddupCell ()

@property (nonatomic, strong) UILabel *deskNumLabel;

@property (nonatomic, strong) UILabel *hasStartedLabel;

@property (nonatomic, strong) UILabel *sumGlassLabel;

@property (nonatomic, strong) UILabel *incomeLabel;


@end

@implementation PGDeskAddupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.deskNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80 * BILI_WIDTH, kPGDeskAddupCellHeight)];
        self.deskNumLabel.textColor = [UIColor blackColor];
        self.deskNumLabel.textAlignment = NSTextAlignmentCenter;
        self.deskNumLabel.font = [UIFont boldSystemFontOfSize:26 * BILI_WIDTH];
//        self.deskNumLabel.text = @"K13";
        
        CGFloat width = (SCREEN_WIDTH - 80 * BILI_WIDTH - 30 * BILI_WIDTH)/3.0;
        
        UILabel *hasStartTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.deskNumLabel.frame), 0, width, kPGDeskAddupCellHeight/2.0)];
        hasStartTitle.textColor = [UIColor lightGrayColor];
        hasStartTitle.textAlignment = NSTextAlignmentCenter;
        hasStartTitle.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        hasStartTitle.text = @"已进行";
        
        
        UILabel *sumGlassTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(hasStartTitle.frame), 0, width, kPGDeskAddupCellHeight/2.0)];
        sumGlassTitle.textColor = [UIColor lightGrayColor];
        sumGlassTitle.textAlignment = NSTextAlignmentCenter;
        sumGlassTitle.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        sumGlassTitle.text = @"点酒水";
        
        UILabel *incomeTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(sumGlassTitle.frame), 0, width, kPGDeskAddupCellHeight/2.0)];
        incomeTitle.textColor = [UIColor lightGrayColor];
        incomeTitle.textAlignment = NSTextAlignmentCenter;
        incomeTitle.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
        incomeTitle.text = @"已营收";
        
        self.hasStartedLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(hasStartTitle.frame), CGRectGetMaxY(hasStartTitle.frame), width, kPGDeskAddupCellHeight/2.0)];
        self.hasStartedLabel.textColor = [UIColor blackColor];
        self.hasStartedLabel.textAlignment = NSTextAlignmentCenter;
        self.hasStartedLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
//        self.hasStartedLabel.text = @"8 轮";
//        self.hasStartedLabel.backgroundColor = UIColorFromRGB(0x29c2fa);
//        self.hasStartedLabel.textColor = [UIColor whiteColor];
//        self.hasStartedLabel.clipsToBounds = YES;
//        self.hasStartedLabel.layer.cornerRadius = 21 *BILI_WIDTH;
        
        self.sumGlassLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(sumGlassTitle.frame), CGRectGetMaxY(hasStartTitle.frame), width, kPGDeskAddupCellHeight/2.0)];
        self.sumGlassLabel.textColor = [UIColor blackColor];
        self.sumGlassLabel.textAlignment = NSTextAlignmentCenter;
        self.sumGlassLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
//        self.sumGlassLabel.text = @"16 瓶";
//        self.sumGlassLabel.backgroundColor = UIColorFromRGB(0xFF9415);
//        self.sumGlassLabel.textColor = [UIColor whiteColor];
//        self.sumGlassLabel.clipsToBounds = YES;
//        self.sumGlassLabel.layer.cornerRadius = 21 *BILI_WIDTH;
//        
        self.incomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(incomeTitle.frame), CGRectGetMaxY(hasStartTitle.frame), width, kPGDeskAddupCellHeight/2.0)];
        self.incomeLabel.textColor = [UIColor blackColor];
        self.incomeLabel.textAlignment = NSTextAlignmentCenter;
        self.incomeLabel.font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
//        self.incomeLabel.text = @"89:00 元";
//        self.incomeLabel.backgroundColor = UIColorFromRGB(0xFF6460);
//        self.incomeLabel.textColor = [UIColor whiteColor];
//        self.incomeLabel.clipsToBounds = YES;
//        self.incomeLabel.layer.cornerRadius = 21 *BILI_WIDTH;

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        UIView *greyLine = [[UIView alloc] initWithFrame:CGRectMake(0,  90*BILI_WIDTH -0.5, SCREEN_WIDTH, 0.5)];
        greyLine.backgroundColor = [UIColor lightGrayColor];
    

        [self.contentView addSubview:hasStartTitle];
        [self.contentView addSubview:sumGlassTitle];
        [self.contentView addSubview:incomeTitle];
        [self.contentView addSubview:self.deskNumLabel];
        [self.contentView addSubview:self.hasStartedLabel];
        [self.contentView addSubview:self.sumGlassLabel];
        [self.contentView addSubview:self.incomeLabel];
        [self.contentView addSubview:greyLine];
    
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (!self.dataSource || [self.dataSource allKeys]==0) {
        return;
    }
    
    if (![[self.dataSource objectforNotNullKey:@"deskName"] isKindOfClass:[NSNull class]]) {
        self.deskNumLabel.text = [NSString stringWithFormat:@"%@",[self.dataSource objectforNotNullKey:@"deskName"]];
    }
    
    
    self.hasStartedLabel.text = [NSString stringWithFormat:@"%@ 轮",[self.dataSource objectforNotNullKey:@"roundNum"]];
    
    if ([[self.dataSource objectforNotNullKey:@"amount"] isKindOfClass:[NSNull class]]) {
        
        self.incomeLabel.text = @"0.00元";
        
    }else{
        self.incomeLabel.text = [NSString stringWithFormat:@"%0.0f元",[[self.dataSource objectforNotNullKey:@"amount"] floatValue]  ];
    }
    
    
    

    self.sumGlassLabel.text = [NSString stringWithFormat:@"%@ 瓶",[self.dataSource objectforNotNullKey:@"drinkNum"]];
    
}


//- (void)drawCellWithDeskNum:(NSString *)deskNum
//{
//    self.deskNumLabel.text = deskNum;
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
