//
//  ContactsCell.m
//  DualMobile
//
//  Created by QUAN on 16/4/18.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ContactsCell.h"

@interface ContactsCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (nonatomic, strong) UIView *enditView;
@end

@implementation ContactsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)setModel:(AddressBookModel *)model{
    _model = model;
    
    self.nameLabel.text = model.name;
    
    if (model.userImage == nil) {
        self.iconImage.image = [UIImage imageNamed:@"icon_head"];
        
    }else{
        self.iconImage.image =[UIImage imageWithData:model.userImage];
    }
    
    
    
}

//工具栏
-(UIView *)enditView{
    if (_enditView == nil) {
        
        _enditView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50)];
        
        _enditView.backgroundColor = [UIColor whiteColor];
        
        UIButton *allseld = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, _enditView.height)];
        [allseld setTitle:@"全选" forState:UIControlStateNormal];
        [allseld setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        allseld.titleLabel.font = [UIFont systemFontOfSize:15];
        [allseld addTarget:self action:@selector(clickAllSelect:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 50, 0, 50, _enditView.height)];
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:RGBA(241, 145, 73 ,1) forState:UIControlStateNormal];
        deleteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [deleteBtn addTarget:self action:@selector(clickDelete:) forControlEvents:UIControlEventTouchUpInside];
        
        [_enditView addSubview:allseld];
        [_enditView addSubview:deleteBtn];
        
    }
    return _enditView;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    
    if (editing){ //编辑状态
        
        if (self.editingStyle == (UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete)){ //编辑多选状态
            
            //添加工具栏
            [[UIApplication sharedApplication].keyWindow addSubview:self.enditView];
            
        }
        
    }else{
        
        //移除工具栏
        [self.enditView removeFromSuperview];
        
    }

    
}

//全选
-(void)clickAllSelect:(UIButton *)sender{
    NSLog(@"全选");
}

//删除
-(void) clickDelete:(UIButton *) sender{
    NSLog(@"删除");
}



@end
