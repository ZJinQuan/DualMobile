//
//  MessageCell.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MessageCell.h"

@interface MessageCell ()

@property (nonatomic, assign) NSInteger TagVale;

@property (nonatomic, strong) UIView *enditView;

@end


@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
    [super setSelected:selected animated:animated];
    
    if (self.editing)//仅仅在编辑状态的时候需要自己处理选中效果
    {
        if (selected){
            //选中时的效果      
            
        }
        else {
            //非选中时的效果

        }
    }
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    
    if (editing){ //编辑状态
        
        if (self.editingStyle == (UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete)){ //编辑多选状态
            
            self.enditView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50)];
            
            //        self.enditView.y = kScreenHeight - self.tabBarController.tabBar.height;
            
            self.enditView.backgroundColor = [UIColor whiteColor];
            
            UIButton *allseld = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, self.enditView.height)];
            [allseld setTitle:@"全选" forState:UIControlStateNormal];
            [allseld setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            allseld.titleLabel.font = [UIFont systemFontOfSize:15];
            [allseld addTarget:self action:@selector(clickAllSelect:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 50, 0, 50, self.enditView.height)];
            [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
            [deleteBtn setTitleColor:RGBA(241, 145, 73 ,1) forState:UIControlStateNormal];
            deleteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [deleteBtn addTarget:self action:@selector(clickDelete:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.enditView addSubview:allseld];
            [self.enditView addSubview:deleteBtn];
            
            [[UIApplication sharedApplication].keyWindow addSubview:self.enditView];
            
        }
        
    }else{
        
        [self.enditView removeFromSuperview];
        
    }
}

-(void)clickAllSelect:(UIButton *)sender{
    
    NSLog(@"全选");
    
}

-(void) clickDelete:(UIButton *) sender{
    
    NSLog(@"删除");
    
}

@end
