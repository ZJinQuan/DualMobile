//
//  MessageChatCell.m
//  DualMobile
//
//  Created by QUAN on 16/4/22.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MessageChatCell.h"

@interface MessageChatCell ()


@end

@implementation MessageChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setFunctionSupplyWithButton :(UIButton *)button andImageView :(UIImageView *)image
{
    
    
    //  一些设置
    button.titleLabel.numberOfLines = 0;
    //  实现包裹
    button.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    [self layoutIfNeeded];
//    [button updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(button.titleLabel.frame.size.height + 20);
//    }];

    button.height = button.titleLabel.frame.size.height + 20;
    
    //  设置高度
    [self layoutIfNeeded];
    self.height = CGRectGetMaxY(button.frame) > CGRectGetMaxY(image.frame) ? CGRectGetMaxY(button.frame) : CGRectGetMaxY(image.frame);
    self.height += 10;
}

#pragma mark 构造方法
+ (instancetype)taleCellWithTableView :(UITableView *)tableView{
    
    MessageChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"talk"];
    
    if(cell == nil){
        
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    }
    
    return cell;
}



@end
