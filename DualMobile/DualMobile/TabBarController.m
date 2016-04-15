//
//  TabBarController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "TabBarController.h"
#import "MessageViewController.h"
#import "ContactsViewController.h"
#import "PhoneViewController.h"
#import "MainViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //添加至控制器
    [self addChildViewController:[[MessageViewController alloc] init] andTitle:@"消息" andImageName:nil addSeledImage:nil];
    [self addChildViewController:[[ContactsViewController alloc] init] andTitle:@"联系人" andImageName:nil addSeledImage:nil];
    [self addChildViewController:[[PhoneViewController alloc] init] andTitle:@"拨号" andImageName:nil addSeledImage:nil];
    [self addChildViewController:[[MainViewController alloc] init] andTitle:@"我的" andImageName:nil addSeledImage:nil];
    
}

-(void) addChildViewController: (UIViewController *)childController andTitle:(NSString *)title andImageName: (NSString *)image addSeledImage:(NSString *)selectImage{
    
    childController.title = title;
    
    [childController.tabBarItem setImage:[UIImage imageNamed:image]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNamed:selectImage]];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:navVC];
}

@end
