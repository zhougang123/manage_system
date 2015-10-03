//
//  PGApiClient.h
//  ManageSystem
//
//  Created by mac on 15/10/2.
//  Copyright © 2015年 qfpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGApiClient : NSObject

+ (instancetype) sharedManage;

//登录
- (void)pgSystemLoginWithPassword:(NSString *)pwd block:(RequestResponseDetail) block;

//获取每桌统计
- (void)checkPGSystemAllDeskAmountWithDate:(NSString *)dateString block:(RequestResponseDetail) block;

//获取每轮统计
- (void)checkPGSystemAllRoundWithDate:(NSString *)dateString block:(RequestResponseDetail) block;

//获取酒水统计信息
- (void)checkPGSystemAllDrinkWithDate:(NSString *)dateString block:(RequestResponseDetail) block;

//获取某轮每桌统计信息
- (void)checkPGSystemRoundDeskWithDate:(NSString *)dateString block:(RequestResponseDetail) block;

//获取某桌每轮统计信息
- (void)checkPGSystemDeskRoundWithDate:(NSString *)dateString block:(RequestResponseDetail) block;

//安全删除
- (void)pgSystemSafeCleanWithblock:(RequestResponseDetail) block;
@end
