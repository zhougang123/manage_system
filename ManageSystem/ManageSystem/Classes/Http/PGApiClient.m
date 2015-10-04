//
//  PGApiClient.m
//  ManageSystem
//
//  Created by mac on 15/10/2.
//  Copyright © 2015年 qfpay. All rights reserved.
//

#import "PGApiClient.h"

@implementation PGApiClient


+ (instancetype) sharedManage {
    static PGApiClient* shareManage = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        shareManage = [[PGApiClient alloc] init];
    });
    return shareManage;
}

- (AFHTTPRequestOperationManager *)getManagerWithTimeout:(NSTimeInterval)secennd{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    securityPolicy.allowInvalidCertificates = YES;
//    securityPolicy.validatesDomainName = NO;
//    manager.securityPolicy = securityPolicy;
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = secennd ;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    return manager;
}


//登录
- (void)pgSystemLoginWithPassword:(NSString *)pwd block:(RequestResponseDetail) block
{
        
    NSString *path = [apiURLBase stringByAppendingString:apiLogin];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
    NSDictionary *parameter = @{@"password":pwd};
    
    [manager GET:path parameters:parameter success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"登陆:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
           
            block(nil,NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"登陆失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];

    
    

}

//获取某天营收
- (void)checkPgSytemTodayInfoWithDate:(NSString *)dateString block:(RequestResponseDetail)block
{
    
    NSString *path = [apiURLBase stringByAppendingString:apiDayAmonnt];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
   
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"当天信息:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            block([responseObject objectForKey:@"data"],NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"获取当天信息失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];

}


//获取每桌统计
- (void)checkPGSystemAllDeskAmountWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    
    NSString *path = [apiURLBase stringByAppendingString:apiDeskAmount];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
    
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"每桌统计:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            block([responseObject objectForKey:@"data"],NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"获取每桌统计失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];
}

//获取每轮统计
- (void)checkPGSystemAllRoundWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    
    NSString *path = [apiURLBase stringByAppendingString:apiRoundAmount];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
    
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"每轮统计:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            block([responseObject objectForKey:@"data"],NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"获取每轮统计失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];
}

//获取酒水统计信息
- (void)checkPGSystemAllDrinkWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    NSString *path = [apiURLBase stringByAppendingString:apiDrinkAmont];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
    
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"酒水统计:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            block([responseObject objectForKey:@"data"],NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"获取酒水统计失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];
}

//获取某轮每桌统计信息
- (void)checkPGSystemRoundDeskWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
   
    NSString *path = [apiURLBase stringByAppendingString:apiRundDesk];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
    NSDictionary *parameter = @{@"id":dateString};
    
    [manager GET:path parameters:parameter success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"某轮每桌每统计:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            block([responseObject objectForKey:@"data"],NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"获取某轮每桌统计失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];
}

//获取某桌每轮统计信息
- (void)checkPGSystemDeskRoundWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
 
    NSString *path = [apiURLBase stringByAppendingString:apiDeskRound];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
    NSDictionary *parameter = @{@"id":dateString};
    
    [manager GET:path parameters:parameter success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"某桌每轮统计:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            block([responseObject objectForKey:@"data"],NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"获取某桌每轮统计失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];
}

//安全删除
- (void)pgSystemSafeCleanWithblock:(RequestResponseDetail) block
{
 
    NSString *path = [apiURLBase stringByAppendingString:apiOrderClean];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];

    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"删除:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            block(nil,NO,nil);
            
        }else{
            block(nil,YES,[responseObject objectForKey:@"msg"]);
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        NSLog( @"删除失败： %@",[error description]);
        
        block(nil,YES,@"网络异常,请稍后再试");
        
    }];
}
@end
