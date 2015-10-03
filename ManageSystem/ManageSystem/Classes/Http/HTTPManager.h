//
//  HTTPManager.h
//  XiaoYouTong
//
//  Created by 张伟 on 15/5/4.
//  Copyright (c) 2015年 yida. All rights reserved.
//

#import "AFHTTPSessionManager.h"

//static NSString *baseURL = @"http://info.uestcxyt.com/";//比较靠前的域名
//static NSString *baseURL = @"http://192.168.10.58:8080/linju-framework/" ;//开发环境 蔡
//static NSString *baseURL = @"http://115.28.8.83:8080/linju-framework/" ;//开发环境 郭
//static NSString *baseURL = @"http://115.28.8.83:8080/linju-framework/";//测试
//static NSString *baseURL = @"http://113.204.101.138:8080/linju-framework";//二期一阶段


@interface HTTPManager : AFHTTPSessionManager

+ (instancetype) shareClient;

- (NSString *) getBaseUrl;
@end
