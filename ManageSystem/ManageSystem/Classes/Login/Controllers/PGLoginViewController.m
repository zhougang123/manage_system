//
//  PGLoginViewController.m
//  ManageSystem
//
//  Created by mac on 15/9/22.
//  Copyright (c) 2015年 qfpay. All rights reserved.
//

#import "PGLoginViewController.h"

@interface PGLoginViewController ()

@property (nonatomic, strong) UITextField *pwdTF;

@end

@implementation PGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登 录";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = UIColorFromRGB(0xECECEF);
    
    UIView *loginBGView = [[UIView alloc] initWithFrame:CGRectMake(-2, 40 * BILI_WIDTH, SCREEN_WIDTH + 4, 100 * BILI_WIDTH)];
    loginBGView.backgroundColor = [UIColor whiteColor];
    loginBGView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loginBGView.layer.borderWidth = 0.5;
    
    UIView *greyLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(loginBGView.frame)/2.0, SCREEN_WIDTH+4, 1)];
    greyLine.backgroundColor = UIColorFromRGB(0xECECEF);
    
    
    
    UILabel *accountTitle = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 60 * BILI_WIDTH, 50 * BILI_WIDTH)];
    accountTitle.textColor = [UIColor blackColor];
    accountTitle.textAlignment = NSTextAlignmentLeft;
    accountTitle.font = [UIFont systemFontOfSize:15 * BILI_WIDTH];
    accountTitle.text = @"账号:";
    
    UILabel *pwdTitle = [[UILabel alloc] initWithFrame:CGRectMake(16, 50 * BILI_WIDTH, 60 * BILI_WIDTH, 50 * BILI_WIDTH)];
    pwdTitle.textColor = [UIColor blackColor];
    pwdTitle.textAlignment = NSTextAlignmentLeft;
    pwdTitle.font = [UIFont systemFontOfSize:15 * BILI_WIDTH];
    pwdTitle.text = @"密码:";
    
    UILabel *adminTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(accountTitle.frame), 0, SCREEN_WIDTH - CGRectGetMaxX(accountTitle.frame), 50 * BILI_WIDTH)];
    adminTitle.textColor = [UIColor blackColor];
    adminTitle.textAlignment = NSTextAlignmentLeft;
    adminTitle.font = [UIFont systemFontOfSize:15 * BILI_WIDTH];
    adminTitle.text = @"admin";
    
    self.pwdTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(accountTitle.frame), 50 * BILI_WIDTH, SCREEN_WIDTH - CGRectGetMaxX(accountTitle.frame), 50 * BILI_WIDTH)];
    self.pwdTF.borderStyle = UITextBorderStyleNone;
    self.pwdTF.font = [UIFont systemFontOfSize:15 * BILI_WIDTH];
    self.pwdTF.secureTextEntry = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelKeyBoard)];

    [loginBGView addSubview:accountTitle];
    [loginBGView addSubview:adminTitle];
    [loginBGView addSubview:pwdTitle];
    [loginBGView addSubview:self.pwdTF];
    
    [loginBGView addSubview:greyLine];
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:loginBGView];
    
    
    UIBarButtonItem *rightItem =[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(loginAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)loginAction{
    [[PGApiClient sharedManage] pgSystemLoginWithPassword:@"111111" block:^(id response, BOOL isError, NSString *errorMessage) {
        NSLog(@"%@", response);
    }];
}

- (void)cancelKeyBoard
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
