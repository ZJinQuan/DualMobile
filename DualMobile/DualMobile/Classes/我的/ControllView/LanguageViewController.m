//
//  LanguageViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/21.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "LanguageViewController.h"

@interface LanguageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *languageView;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.languageView.dataSource = self;
    self.languageView.delegate = self;
    self.languageView.backgroundColor = [UIColor clearColor];
    
}

#pragma mark UITableViewDelegate
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12;
    
}

/**
 *  当前行已经被选中时调用
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //设置其accessoryType 为CheckMark
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
}

/**
 *  当前行被取消选中时调用
 */
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *arr = @[@"跟随系统(System)", @"中文(Chineses)", @"繁体中文(Traditionl Chinese)", @"英文(English)"];
    
    cell.textLabel.text = arr[indexPath.row];
    
    
    return cell;
}


@end
