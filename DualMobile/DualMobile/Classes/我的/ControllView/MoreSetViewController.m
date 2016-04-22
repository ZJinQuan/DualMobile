//
//  MoreSetViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/21.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MoreSetViewController.h"

@interface MoreSetViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *moreSetView;

@end

@implementation MoreSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moreSetView.dataSource = self;
    self.moreSetView.delegate = self;
    self.moreSetView.backgroundColor = [UIColor clearColor];
    
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"配件相应";
    }else{
        return @"其他";
    }
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *arr1 = @[@"丢失配件时长鸣报警", @"呼叫配件", @"手机遗失报警"];
    NSArray *arr2 = @[@"显示电量百分比", @"拍照键接听/挂电话"];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    [btn setImage:[UIImage imageNamed:@"me_btn_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"me_btn_s"] forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(kaiguan:) forControlEvents:UIControlEventTouchUpInside];
    
    switch (indexPath.section) {
        case 0:
            
            
            cell.textLabel.text = arr1[indexPath.row];
            
            if (indexPath.row == 1) {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }else{
                cell.accessoryView = btn;
            }
            
            break;
        case 1:
            cell.textLabel.text = arr2[indexPath.row];
            cell.accessoryView = btn;
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

-(void) kaiguan:(UIButton *)sender {

    if (sender.selected) {
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
    
}

@end
