//
//  DeviceScanViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/21.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "DeviceScanViewController.h"

@interface DeviceScanViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *deviceTableView;


@end

@implementation DeviceScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.deviceTableView.dataSource = self;
    self.deviceTableView.delegate = self;
    
    self.deviceTableView.backgroundColor = [UIColor clearColor];
}
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 12;
    }
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
            
        default:
            break;
    }
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 1:
            return @"我的设备";
            break;
        case 2:
            return @"其他设备";
            break;
            
        default:
            break;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    
    switch (indexPath.section) {
        case 0:
            
            cell.textLabel.text = @"当前设备名称";
            cell.detailTextLabel.text = @"设备1";
            
            break;
        case 1:
            
            cell.textLabel.text = [NSString stringWithFormat:@"设备%ld",(indexPath.row) + 1];
            
            break;
        case 2:
            
            cell.textLabel.text = [NSString stringWithFormat:@"设备%ld",(indexPath.row) + 3];
            
            break;
            
        default:
            break;
    }
    
    
    
    return cell;
}


@end
