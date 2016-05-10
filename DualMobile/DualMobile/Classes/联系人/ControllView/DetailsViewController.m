//
//  DetailsViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/20.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "DetailsViewController.h"
#import "PopMenuView.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNum;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.model.name;
    self.phoneNum.text = self.model.tel;
    
    if (self.model.userImage == nil) {
        self.iconImage.image = [UIImage imageNamed:@"icon_head"];
    }else{
        self.iconImage.image = [UIImage imageWithData:self.model.userImage];
    }
    
    
}

//拨打电话
- (IBAction)clickDialTelephone:(UIButton *)sender {
    
    UIView *dialView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    
    dialView.backgroundColor = [UIColor purpleColor];
    
    PopMenuView *popView = [[PopMenuView alloc] initWithCustomView:dialView];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect rect = [sender convertRect:sender.bounds toView:window];
    
    [popView showWithView:sender andX:CGRectGetMidX(rect) andY:CGRectGetMaxY(rect) + 10];
}

//发送信息
- (IBAction)clickSendMessage:(UIButton *)sender {
}

@end
