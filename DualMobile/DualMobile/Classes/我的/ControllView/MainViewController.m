//
//  MainViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MainViewController.h"
#import "UserDetailsViewController.h"
#import "DeviceScanViewController.h"
#import "TransferViewController.h"
#import "VoiceViewController.h"
#import "LanguageViewController.h"
#import "SecurityViewController.h"
#import "GuideViewController.h"
#import "MoreSetViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *userView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBarBtn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickUserInterface)];
    
    [self.userView addGestureRecognizer:tap];
    
}

-(void) clickUserInterface{ 
    
    UserDetailsViewController *userVC = [[UserDetailsViewController alloc] init];
    
    [userVC setHidesBottomBarWhenPushed:YES];
    
    userVC.title = @"个人资料";
    
    [self.navigationController pushViewController:userVC animated:YES];
}


//点击事件
- (IBAction)clickSetInterface:(UIButton *)sender {
    
    switch (sender.tag) {
        case 2001:{
            
            DeviceScanViewController *nextVC = [[DeviceScanViewController alloc] init];
            [nextVC setHidesBottomBarWhenPushed:YES];
            nextVC.title = @"设备扫描";
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 2002:{
            
            TransferViewController *nextVC = [[TransferViewController alloc] init];
            [nextVC setHidesBottomBarWhenPushed:YES];
            nextVC.title = @"呼叫转移";
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 2003:{
            
            VoiceViewController *nextVC = [[VoiceViewController alloc] init];
            [nextVC setHidesBottomBarWhenPushed:YES];
            nextVC.title = @"声音";
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 2004:{
            
            LanguageViewController *nextVC = [[LanguageViewController alloc] init];
            [nextVC setHidesBottomBarWhenPushed:YES];
            nextVC.title = @"多语言环境";
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 2005:{
            
            SecurityViewController *nextVC = [[SecurityViewController alloc] init];
            [nextVC setHidesBottomBarWhenPushed:YES];
            nextVC.title = @"安全与隐私";
            [self.navigationController pushViewController:nextVC animated:YES];
        }
            break;
        case 2006:{
            
            GuideViewController *nextVC = [[GuideViewController alloc] init];
            [nextVC setHidesBottomBarWhenPushed:YES];
            nextVC.title = @"用户指南";
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 2007:{
            
            MoreSetViewController *nextVC = [[MoreSetViewController alloc] init];
            [nextVC setHidesBottomBarWhenPushed:YES];
            nextVC.title = @"更多设置";
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
            
        default:
            break;
    }
    
    
}

-(void) initNavBarBtn{
    
    //电量
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_electric"] style:UIBarButtonItemStylePlain target:nil action:nil];
    leftBtn.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    //拍照
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_photo"] style:UIBarButtonItemStylePlain target:self action:@selector(clickTakePictures)];
    rightBtn.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

-(void)clickTakePictures{
    NSLog(@"拍照");
}
@end
