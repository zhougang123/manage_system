//
//  PGApiDefines.h
//  ManageSystem
//
//  Created by mac on 15/10/2.
//  Copyright © 2015年 qfpay. All rights reserved.
//

#ifndef PGApiDefines_h
#define PGApiDefines_h

static NSString *const apiURLBase     =     @"http://123.57.237.43:8080/api";   //服务器基本IP

static NSString *const apiLogin       =     @"/admin/login"; //登录

static NSString *const apiDayAmonnt     =     @"/statistics/today";//当天统计

static NSString *const apiDeskAmount  =     @"/statistics/desk";  //每桌统计


static NSString *const apiRoundAmount =    @"/statistics/round";  //每轮统计


static NSString *const apiDrinkAmont  =    @"/statistics/drink";  //酒水统计


static NSString *const apiRundDesk    =    @"/statistics/round/desk";       //获取某轮每座统计

static NSString *const apiDeskRound   =    @"/statistics/desk/round";        //获取某座每轮统计

static NSString *const apiOrderClean  =    @"/order/clean";       //安全删数据


/***
 ***定义一个返回数据的block
 ***/

typedef void (^RequestResponseDetail)(id response, BOOL isError , NSString *errorMessage);


static NSString *SERVICE_ERROR = @"网络异常,数据获取失败";

static NSString *ERROR_MESSAGE = @"errorMsg";

static NSString *ERROR_CODE = @"errorCode";


#endif /* PGApiDefines_h */
