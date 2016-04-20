//
//  PhoneViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "PhoneViewController.h"
#import "KeyboardView.h"

@interface PhoneViewController ()<UITabBarDelegate>

@property (nonatomic, strong) KeyboardView *keyBoard;

@property (nonatomic, assign) NSInteger index;

@property (weak, nonatomic) IBOutlet UITextField *phoneText;

@end

@implementation PhoneViewController

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
        
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavBarBtn];
    
    KeyboardView *keyBoard = [[KeyboardView alloc] init];
    
    CGFloat keyHeight = kScreenHeight / 3;
    
    keyBoard.frame = CGRectMake(0, kScreenHeight - keyHeight - 64 - 44, kScreenWidth, keyHeight);
    
    [self.view addSubview:keyBoard];
    self.keyBoard = keyBoard;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickPhoneNum:) name:@"phoneNum" object:nil];
    
    
    self.index = 1;
}

-(void)clickPhoneNum:(NSNotification *)not {
    
    NSLog(@"%@",not.object);
//    
//    UITextField *phoneText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    
//    self.navigationItem.titleView = phoneText;
    
    
    self.phoneText.text = [NSString stringWithFormat:@"%@%@",self.phoneText.text,not.object];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    switch (self.index) {
        case 1:{
            [UIView animateWithDuration:0.2 animations:^{
                self.keyBoard.y = kScreenHeight;
            }];
            self.index = 2;
        }
            break;
        case 2:{
            [UIView animateWithDuration:0.2 animations:^{
                
                CGFloat keyHeight = kScreenHeight / 3;
                self.keyBoard.y = kScreenHeight - keyHeight - 64 - 44;
            }];
            self.index = 1;
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    
}

-(void) initNavBarBtn{
    
    //编辑
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEdit)];
    leftBtn.tintColor = [UIColor blackColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.navigationItem.title = @"通话";
}

-(void) clickEdit{
    NSLog(@"编辑");
}

@end
