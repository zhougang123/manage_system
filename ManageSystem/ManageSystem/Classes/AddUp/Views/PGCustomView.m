//
//  PGCustomView.m
//  ManageSystem
//
//  Created by mac on 15/9/26.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGCustomView.h"



@interface PGCustomView ()


@end

@implementation PGCustomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 0.5;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}
- (void)drawRect:(CGRect)rect
{
    UIFont *font = [UIFont systemFontOfSize:14 * BILI_WIDTH];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    

    NSDictionary *attributes= [NSDictionary dictionaryWithObjectsAndKeys:
                               font, NSFontAttributeName,
                               paragraphStyle,NSParagraphStyleAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,[UIColor blackColor],NSStrokeColorAttributeName, nil];
    
    
   
    CGFloat width = rect.size.width/4.0;
    
    for (int i = 0; i < [self.detialsArray count]; i++) {
        NSDictionary *detials = self.detialsArray[i];
        NSString *string1 = detials[@"string1"];
        NSString *string2 = detials[@"string2"];
        NSString *string3 = detials[@"string3"];
        NSString *string4 = detials[@"string4"];
    
        [string1 drawInRect: CGRectMake(0, i * kOneLineHeight + 10 * BILI_WIDTH, width, kOneLineHeight) withAttributes:attributes];
        [string2 drawInRect: CGRectMake(width, i * kOneLineHeight +10 * BILI_WIDTH, width, kOneLineHeight) withAttributes:attributes];
        [string3 drawInRect: CGRectMake(width*2, i * kOneLineHeight + 10 * BILI_WIDTH, width, kOneLineHeight) withAttributes:attributes];
        [string4 drawInRect: CGRectMake(width*3, i * kOneLineHeight + 10 * BILI_WIDTH, width, kOneLineHeight) withAttributes:attributes];
        
    }
   
}
@end
