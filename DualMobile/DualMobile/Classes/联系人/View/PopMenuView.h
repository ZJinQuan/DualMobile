//
//  PopMenuView.h
//  DualMobile
//
//  Created by QUAN on 16/4/18.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopMenuView : UIButton

-(instancetype) initWithCustomView: (UIView *)customView;

-(void)showWithView:(UIView *)targetView andX :(CGFloat) orighX andY:(CGFloat) orighY;

@end
