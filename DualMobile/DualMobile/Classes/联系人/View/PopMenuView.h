//
//  PopMenuView.h
//  新浪微末OC
//
//  Created by QUAN on 15/11/25.
//  Copyright © 2015年 QUAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopMenuView : UIButton

-(instancetype) initWithCustomView: (UIView *)customView;

-(void) showWithView: (UIView *)targetView;

@end
