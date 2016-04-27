//
//  BlackListViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/22.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "BlackListViewController.h"

@interface BlackListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *blackListView;

@end

@implementation BlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blackListView.dataSource = self;
    self.blackListView.delegate = self;
    self.blackListView.backgroundColor = [UIColor clearColor];
}
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 0.1;
    }else{
        return 30;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 0.1;
    }else{
        return 0.1;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"你不会收到黑名单上联系人的来电和信息";
    }
    return nil;
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 1) {
        return 1;
    }else{
        return 3;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section == 1) {
        cell.textLabel.text = @"添加...";
        cell.textLabel.textColor = RGBA(241, 145, 73, 1);
    }else{
        cell.textLabel.text = @"张三 (深圳 移动)";
    }
    
    return cell;
}



@end
