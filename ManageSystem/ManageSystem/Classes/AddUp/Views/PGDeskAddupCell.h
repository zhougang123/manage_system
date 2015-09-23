//
//  PGRoundAddupCell.h
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kPGDeskAddupCellHeight (80 * BILI_WIDTH)
@interface PGDeskAddupCell : UITableViewCell

- (void)drawCellWithDeskNum:(NSString *)deskNum;

@end
