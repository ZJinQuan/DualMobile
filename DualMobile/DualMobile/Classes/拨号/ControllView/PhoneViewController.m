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


@property (nonatomic, strong) UITextField *phoneText1;

@property (nonatomic, strong) UIView *dialView;

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavBarBtn];
    
    KeyboardView *keyBoard = [[KeyboardView alloc] init];
    
    CGFloat keyHeight = kScreenHeight / 3;
    
    keyBoard.frame = CGRectMake(0, kScreenHeight - keyHeight - 64 - 44, kScreenWidth, keyHeight);
    
    [self.view addSubview:keyBoard];
    self.keyBoard = keyBoard;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickPhoneNum:) name:@"phoneNum" object:nil];
    
    UITextField *phoneText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    
    self.navigationItem.titleView = phoneText;
    phoneText.tintColor = [UIColor blackColor];
    phoneText.text = @"通讯";
    phoneText.userInteractionEnabled = NO;
    phoneText.textAlignment = NSTextAlignmentCenter;
    self.phoneText1 = phoneText;
    
    self.index = 1;
    
    
}

//点击拨号键盘
-(void)clickPhoneNum:(NSNotification *)not {
    
    NSLog(@"%@",not.object);
    
    if ([self.phoneText1.text isEqualToString:@"通讯"]) {
        
        self.phoneText1.textColor = RGB(241, 145, 73);
        self.phoneText1.font = [UIFont systemFontOfSize:22];
        self.phoneText1.text = not.object;
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"me_btn_delete"] style:UIBarButtonItemStylePlain target:self action:@selector(clickEmpty)];
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
        
        
        [self initDialView];
        
        
        [[UIApplication sharedApplication].keyWindow addSubview:self.dialView];
        
    }else{
        
        self.phoneText1.text = [NSString stringWithFormat:@"%@%@",self.phoneText1.text,not.object];
    
    }
    
    
}

-(void) clickEmpty{
    
    self.phoneText1.text = @"通讯";
    self.phoneText1.textColor = [UIColor blackColor];
    
    [self.dialView removeFromSuperview];
    
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark 拨号View
-(void) initDialView{
    
    self.dialView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - self.tabBarController.tabBar.height, kScreenWidth, self.tabBarController.tabBar.height)];
    
    self.dialView.backgroundColor = [UIColor whiteColor];
    
    //拨号键
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth / 2, self.dialView.height)];
    btn.backgroundColor = RGB(241, 145, 73);
    [btn setImage:[UIImage imageNamed:@"btn_call"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickDialup) forControlEvents:UIControlEventTouchUpInside];
    
    
    //隐藏拨号键盘
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(btn.width, 0, kScreenWidth / 4, self.dialView.height)];
    [btn1 setImage:[UIImage imageNamed:@"btn_callboard"] forState:UIControlStateNormal];
    [btn1 setTitle:@"拨号" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:10];
    [btn1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    btn1.titleEdgeInsets = UIEdgeInsetsMake(0, -20, -35, 0);
    btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 10, 0);
    [btn1 addTarget:self action:@selector(clickHidden) forControlEvents:UIControlEventTouchUpInside];
    
    //删除键
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth / 2 + btn1.width, 0, kScreenWidth / 4, self.dialView.height)];
    [btn2 setImage:[UIImage imageNamed:@"btn_delete"] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"删除" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:11];
    btn2.titleEdgeInsets = UIEdgeInsetsMake(0, -20, -35, 0);
    btn2.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 10, 0);
    [btn2 addTarget:self action:@selector(clickDelete) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth / 2 + btn1.width, 10, 1, 30)];
    line.backgroundColor = [UIColor lightGrayColor];

    [self.dialView addSubview:btn];
    [self.dialView addSubview:btn1];
    [self.dialView addSubview:btn2];
    [self.dialView addSubview:line];
    
}

//拨号键
-(void)clickDialup{
    
    UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"拨号中..." message:self.phoneText1.text delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [aler show];
    
    [self clickEmpty];
}

//隐藏拨号键盘
-(void) clickHidden{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.keyBoard.y = kScreenHeight;
    }];
    self.index = 2;
    
    
}

//删除
-(void)clickDelete{
    
    if (!(self.phoneText1.text.length < 1)) {
        
        self.phoneText1.text = [self.phoneText1.text substringWithRange:NSMakeRange(0, self.phoneText1.text.length - 1)];
        
        if (self.phoneText1.text.length == 0){
        
            self.phoneText1.text = @"通讯";
            self.phoneText1.textColor = [UIColor blackColor];
            
            [self.dialView removeFromSuperview];
        }
    }

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
