//
//  BaseViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UITabBarDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = YES;
    
    self.view.backgroundColor = RGB(240, 240, 240);
    
    //返回图片
    UIImage *backButtonImage = [[UIImage imageNamed:@"Back_Chevron"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
}

/**
 *  退出键盘
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if (touch.tapCount >= 1) {
        
        [self.view endEditing:YES];
        
    }
}

@end
