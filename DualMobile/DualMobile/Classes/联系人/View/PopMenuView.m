//
//  PopMenuView.m
//  新浪微末OC
//
//  Created by QUAN on 15/11/25.
//  Copyright © 2015年 QUAN. All rights reserved.
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

    }
    
    return self;
}

-(void)showWithView:(UIView *)targetView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //把button的坐标转换到屏幕坐标
    //    __ convertRect:__ toView:__
    CGRect rect = [targetView convertRect:targetView.bounds toView:window];
    
    self.bgView.centerX = CGRectGetMidX(rect);
    self.bgView.y = CGRectGetMaxY(rect);
    
    [window addSubview:self];
    

}

//是视图隐藏
-(void) hide:(UIButton *)btn {
    [self removeFromSuperview];
}
@end
