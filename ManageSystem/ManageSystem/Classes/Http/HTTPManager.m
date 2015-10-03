//
//  HTTPManager.m
//  XiaoYouTong
//
//  Created by 张伟 on 15/5/4.
//  Copyright (c) 2015年 yida. All rights reserved.
//

#import "HTTPManager.h"




@implementation HTTPManager

+ (instancetype) shareClient {
    static HTTPManager *shareClient = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        shareClient = [[HTTPManager alloc] initWithBaseURL:[NSURL URLWithString:apiURLBase]];
    });
    return shareClient;
}

- (NSString *) getBaseUrl{
    return apiURLBase;
}
@end
