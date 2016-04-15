//
//  LoginViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/14.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewContrller.h"
#import "ImportViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountNum;
@property (weak, nonatomic) IBOutlet UITextField *passWork;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册按钮
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerItem)];
    
    [rightBtn setTintColor:[UIColor blackColor]];
    
    [rightBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

//注册
-(void) registerItem{
    
    RegisterViewContrller *registerVC = [[RegisterViewContrller alloc] init];
    
    [self.navigationController pushViewController:registerVC animated:YES];
}

//登录
- (IBAction)clickLoginBtn:(id)sender {
    
    if (self.accountNum.text.length < 1) {
        NSLog(@"请输入手机号");
    }else if (self.passWork.text.length < 1) {
        NSLog(@"请输入密码");
    }else{
        
    }
    
    ImportViewController *importVC = [[ImportViewController alloc] init];
    
    importVC.logId = @"登录成功";
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:importVC];
    
    [self presentViewController:navVC animated:YES completion:nil];
}
@end
