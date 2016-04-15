//
//  RegisterViewContrller.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "RegisterViewContrller.h"
#import "ImportViewController.h"

@interface RegisterViewContrller ()

@end

@implementation RegisterViewContrller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark  注册
- (IBAction)clickRegisterBtn:(id)sender {
    
    ImportViewController *importVC = [[ImportViewController alloc] init];
    
    importVC.logId = @"注册成功";
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:importVC];
    
    [self presentViewController:navVC animated:YES completion:nil];
    
}

@end
