//
//  PopMenuView.m
//  DualMobile
//
//  Created by QUAN on 16/4/18.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "PopMenuView.h"

@interface PopMenuView ()

@property (nonatomic, weak) UIImageView *bgView;

@end

@implementation PopMenuView

-(instancetype)initWithCustomView:(UIView *)customView {
    
    self = [super init];
    
    if (self) {
        self.size = [UIScreen mainScreen].bounds.size;
        //添加点击事件
        [self addTarget:self action:@selector(hide:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:@"popover_background_right"];
        //设置可以接收用户的点击事件
        imageView.userInteractionEnabled = YES;
        imageView.image = image;
        
        imageView.size = CGSizeMake(customView.width + 10, customView.height + 20);
        
        customView.x = 5;
        customView.y = 12;
        
        [imageView addSubview:customView];
        
        [self addSubview:imageView];
        self.bgView = imageView;

        self.backgroundColor = RGBA(184, 184, 184, 0.5);
        
        
    }
    
    return self;
}

-(void)showWithView:(UIView *)targetView andX :(CGFloat) orighX andY:(CGFloat) orighY{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.bgView.centerX = orighX;
    self.bgView.y = orighY;

    [window addSubview:self];
    
}

//是视图隐藏
-(void) hide:(UIButton *)btn {
    [self removeFromSuperview];
}
@end
