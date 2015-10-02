//
//  PGTurnDetailTableViewCell.m
//  ManageSystem
//
//  Created by RIMI on 15/9/24.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGTurnDetailTableViewCell.h"

#define KlabelTag 888

#define labelEdge 15.0
#define contentLabelW ((SCREEN_WIDTH - (labelEdge * 2) ) / 4.0)
#define contentLabelH (15 * BILI_WIDTH + 25 * BILI_WIDTH)

@implementation PGTurnDetailTableViewCell

{
    UILabel *deskNumLb;
    UILabel *earningsLb;
    UILabel *timeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat labeTopedge = 10.0;
        
        deskNumLb = [[UILabel alloc]initWithFrame:CGRectMake(labelEdge , labeTopedge, 50 * BILI_WIDTH, 25 * BILI_WIDTH)];
        
        
        earningsLb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 100 * BILI_WIDTH - labelEdge, labeTopedge, 100 * BILI_WIDTH, 25 * BILI_WIDTH)];
        
        self.detailView = [[UIView alloc]initWithFrame:CGRectMake(labelEdge, CGRectGetMaxY(deskNumLb.frame) + labeTopedge, SCREEN_WIDTH - labelEdge * 2, contentLabelH)];
        
        timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(earningsLb.frame), CGRectGetMaxY(self.detailView.frame) + 5 * BILI_WIDTH, 100 * BILI_WIDTH, 21 * BILI_WIDTH)];
        
        
        deskNumLb.textAlignment = NSTextAlignmentLeft;
        earningsLb.textAlignment = NSTextAlignmentRight;
        timeLabel.textAlignment = NSTextAlignmentRight;
        deskNumLb.font = [UIFont systemFontOfSize:16 * BILI_WIDTH];
        earningsLb.font = [UIFont systemFontOfSize:16 * BILI_WIDTH];
        timeLabel.font = [UIFont systemFontOfSize:12 * BILI_WIDTH];
        earningsLb.textColor = UIColorFromRGB(0xFD850A);
        timeLabel.textColor = [UIColor lightGrayColor];
        
        self.detailView.layer.borderWidth = 1.0;
        self.detailView.layer.borderColor = UIColorFromRGB(0xdddddd).CGColor;
        self.detailView.layer.cornerRadius = 5.0;
        
        
        [self addSubview:deskNumLb];
        [self addSubview:earningsLb];
        [self addSubview:self.detailView];
        [self addSubview:timeLabel];
        
    }
    
    return self;
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (!self.dataSource || [self.dataSource isKindOfClass:[NSNull class]]) {
        
        return;
    }
    
    NSString *deskNumer = [self.dataSource objectForKey:@"deskNumber"];
    if (deskNumer) {
        deskNumLb.text = deskNumer;
    }
    
    NSString *earnings = [self.dataSource objectForKey:@"earnings"];
    if (earnings) {
        earningsLb.text = [NSString stringWithFormat:@"%@.00元",earnings];
    }
    
    NSDate *date = [self.dataSource objectForKey:@"time"];
    if (date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM:dd hh:mm"];
        timeLabel.text = [formatter stringFromDate:date];
    }
    
    
}



- (CGFloat)getPGturnDetailTableViewCellHight:(NSDictionary *)dataSouce{
    
    
    NSArray *contentArray = [_dataSource objectForKey:@"content"];
    if (contentArray && [contentArray count] > 0) {
        
        CGRect detailViewFrame = self.detailView.frame;
        detailViewFrame.size.height = (contentLabelH) * [contentArray count];
        self.detailView.frame = detailViewFrame;
        
        detailViewFrame = timeLabel.frame;
        detailViewFrame.origin.y = CGRectGetMaxY(self.detailView.frame) + 5 *BILI_WIDTH;
        timeLabel.frame = detailViewFrame;
        
        for (int i = 0 ; i < [contentArray count]; i ++) {
            NSDictionary *dic = contentArray[i];
            
            for (int y = 0 ; y < 4; y ++) {
                UILabel *gameResultLb = (UILabel *) [self.detailView viewWithTag:KlabelTag + i *4 + y];
                
                if (!gameResultLb) {
                    gameResultLb = [[UILabel alloc]init];
                    gameResultLb.textAlignment = NSTextAlignmentCenter;
                    gameResultLb.font = [UIFont systemFontOfSize:13 * BILI_WIDTH];
                    gameResultLb.autoresizingMask = UIViewAutoresizingFlexibleWidth;
                    gameResultLb.tag = KlabelTag + i *4 + y;
                    gameResultLb.lineBreakMode = NSLineBreakByTruncatingMiddle;
                    [self.detailView addSubview:gameResultLb];
                }
                
                if ([gameResultLb isHidden]) {
                    gameResultLb.hidden = NO;
                }
                
                
                if (y == 0 ) {
                    
                    gameResultLb.frame = CGRectMake(0 , i * contentLabelH, contentLabelW, contentLabelH);
                    gameResultLb.text = [dic objectForKey:@"gameResult"];
                }else if (y == 1){
                    
                    gameResultLb.frame = CGRectMake(y * contentLabelW  , i * contentLabelH, contentLabelW, contentLabelH);
                    gameResultLb.text = [dic objectForKey:@"bili"];
                    
                }else if (y == 2){
                    gameResultLb.frame = CGRectMake(y * contentLabelW  , i * contentLabelH, contentLabelW, contentLabelH);
                    gameResultLb.text = [dic objectForKey:@"drinksName"];
                }else if (y == 3){
                    gameResultLb.frame = CGRectMake(y * contentLabelW  , i * contentLabelH, contentLabelW, contentLabelH);
                    gameResultLb.text = [NSString stringWithFormat:@"%@瓶",[dic objectForKey:@"drinksNumber"]];
                }
            }
            
            
            
        }
        
    }

    
    
    
    NSLog(@"=====================\ncell 高度：%@",[NSString stringWithFormat:@"%.2f",CGRectGetMaxY(timeLabel.frame) + 5 * BILI_WIDTH]);
    return CGRectGetMaxY(timeLabel.frame) + 5 * BILI_WIDTH;
    
}

- (void)hiddenAllLabel{
    for (UIView *view in self.detailView.subviews) {
        if (![view isHidden]) {
            view.hidden = YES;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
