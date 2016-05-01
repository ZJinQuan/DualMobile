//
//  KeyboardView.m
//  DualMobile
//
//  Created by QUAN on 16/4/19.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "KeyboardView.h"

@interface KeyboardView ()

@end

@implementation KeyboardView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"KeyboardView" owner:self options:nil] lastObject];
    }
    return self;
}

- (IBAction)keyboardViewAction:(UIButton *)sender {
    
    NSInteger tag = sender.tag;
    
    switch (tag)
    {
        case 1000:
        {
            
//            NSLog(@"0");
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"phoneNum" object:@"0" userInfo:nil];
            
            // 0
//            if(self.textFiled.text.length > 0 && ![self.textFiled.text containsString:@"."])
//                self.textFiled.text = [NSString stringWithFormat:@"%@.",self.textFiled.text];
        }
            break;
        case 1010:
        {
            
//            NSLog(@"*");
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"phoneNum" object:@"*" userInfo:nil];
            // *
//            [self.textFiled resignFirstResponder];
        }
            break;
        case 1011:
        {
//            NSLog(@"#");
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"phoneNum" object:@"#" userInfo:nil];
            // #
//            if(self.textFiled.text.length > 0)
//                self.textFiled.text = [self.textFiled.text substringWithRange:NSMakeRange(0, self.textFiled.text.length - 1)];
        }
            break;

        default:
        {
            
//            NSLog(@"%d",sender.tag - 1000);
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"phoneNum" object:[NSString stringWithFormat:@"%ld",sender.tag - 1000] userInfo:nil];
            // 数字
//            self.textFiled.text = [NSString stringWithFormat:@"%@%ld",self.textFiled.text,sender.tag - 1000];
        }
            break;
    }

    
    
}

@end
