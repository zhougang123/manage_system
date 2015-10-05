//
//  UILabel+StringFrame.m
//  ManageSystem
//
//  Created by RIMI on 15/10/4.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "UILabel+StringFrame.h"

@implementation UILabel (StringFrame)


- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

@end
