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
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    
    return manager;
}


//登录
- (void)pgSystemLoginWithPassword:(NSString *)pwd block:(RequestResponseDetail) block
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:1];
    [params setObject:pwd forKey:@"password"];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *path = [apiURLBase stringByAppendingString:apiLogin];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
    AFHTTPRequestOperationManager *manager = [self getManagerWithTimeout:15];
    NSDictionary *parameter = @{@"password":pwd};
    
    [manager GET:path parameters:parameter success:^(AFHTTPRequestOperation * operation, id responseObject) {
        NSLog(@"登陆:/n%@",responseObject);
        
        NSInteger respondCode = [[responseObject objectForKey:@"code"] integerValue];
        if (respondCode == 200) {
            
            
        }else{
           
        }
        
        
        
    } failure:^ (AFHTTPRequestOperation * operation, NSError * error) {
        
        
    }];

    
    
    
//    [[HTTPManager shareClient] GET:@"/admin/login" parameters:params success:^(NSURLSessionDataTask *task, NSDictionary* responseObject) {
//        
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        if(responseObject == nil) {
//            block(nil,YES,SERVICE_ERROR);
//        } else {
//            NSInteger code = [[responseObject objectForKey:ERROR_CODE] integerValue];
//            if(code == 0) {
//                block(responseObject[@"data"],NO,responseObject[ERROR_MESSAGE]);
//            } else {
//                block(nil,YES,responseObject[ERROR_MESSAGE]);
//            }
//        }
//        NSLog(@"error %@ " , responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        block(nil,YES,SERVICE_ERROR);
//    }];

}

//获取每桌统计
- (void)checkPGSystemAllDeskAmountWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    
}

//获取每轮统计
- (void)checkPGSystemAllRoundWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    
}

//获取酒水统计信息
- (void)checkPGSystemAllDrinkWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    
}

//获取某轮每桌统计信息
- (void)checkPGSystemRoundDeskWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    
}

//获取某桌每轮统计信息
- (void)checkPGSystemDeskRoundWithDate:(NSString *)dateString block:(RequestResponseDetail) block
{
    
}

//安全删除
- (void)pgSystemSafeCleanWithblock:(RequestResponseDetail) block
{
    
}
@end
