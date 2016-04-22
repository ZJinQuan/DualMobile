//
//  SecurityViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/21.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "SecurityViewController.h"
#import "ChucklesViewController.h"
#import "BlackListViewController.h"

@interface SecurityViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *securityView;

@end

@implementation SecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.securityView.dataSource = self;
    self.securityView.delegate  = self;
    
    self.securityView.backgroundColor = [UIColor clearColor];
    
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12;
}
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        ChucklesViewController *chuckVC =[[ChucklesViewController alloc] init];
        chuckVC.title = @"以信息回复";
        [self.navigationController pushViewController:chuckVC animated:YES];
        
    }else if(indexPath.section == 1){
        
        BlackListViewController *blackVC = [[BlackListViewController alloc] init];
        
        blackVC.title = @"黑名单";
        
        [self.navigationController pushViewController:blackVC animated:YES];
    }
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSArray *arr = @[@"以信息回复", @"黑名单", @"屏幕锁定"];
    
    cell.textLabel.text = arr[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    [btn setImage:[UIImage imageNamed:@"me_btn_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"me_btn_s"] forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(kaiguan:) forControlEvents:UIControlEventTouchUpInside];
    
    if (indexPath.section == 2) {
        cell.accessoryView = btn;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
