//
//  MessageViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"
#import "WriteNewsViewcontroller.h"
#import "MessageChatViewController.h"

@interface MessageViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchView;
@property (weak, nonatomic) IBOutlet UITableView *messageTableView;

@property (nonatomic, strong) UISegmentedControl *segmented;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    
    
    self.searchView.delegate = self;
    
    self.messageTableView.dataSource = self;
    self.messageTableView.delegate = self;
    self.messageTableView.backgroundColor = RGB(250, 250, 250);
    self.messageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.messageTableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:nil] forCellReuseIdentifier:@"MessageCell"];
    
    //设置导航栏的按钮
    [self initNavBarBtn];
    
    NSArray *segArr = [[NSArray alloc] initWithObjects:@"副卡1",@"副卡2", nil];

    self.segmented = [[UISegmentedControl alloc] initWithItems:segArr];
    
    self.segmented.frame = CGRectMake(0, 0, 150, 30);
    self.segmented.selectedSegmentIndex = 0;
    self.navigationItem.titleView = self.segmented;
    
    [self.segmented addTarget:self action:@selector(clickSwitch:) forControlEvents:UIControlEventValueChanged];
}

-(void) clickSwitch:(UISegmentedControl *)seg{
    
    switch (seg.selectedSegmentIndex) {
        case 0:{
            NSLog(@"卡1");
            [self.messageTableView reloadData];
        }
        break;
            
        case 1:{
            NSLog(@"卡2");
            [self.messageTableView reloadData];
        }
        break;
            
        default:
            break;
    }
    
}

-(void) initNavBarBtn{
    
    //编辑
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEdit)];
    
    leftBtn.tintColor = [UIColor blackColor];
    
    [leftBtn setTitleTextAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15] } forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    //写消息
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"写信息" style:UIBarButtonItemStylePlain target:self action:@selector(clickWriteNews)];
    
    rightBtn.tintColor = [UIColor blackColor];
    
    [rightBtn setTitleTextAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15] } forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

-(void) clickEdit{
    NSLog(@"编辑");
}

-(void) clickWriteNews{
    NSLog(@"发消息");
    
    WriteNewsViewcontroller *writeVC = [[WriteNewsViewcontroller alloc] init];
    
    writeVC.title = @"新信息";
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:writeVC];
    
    [self presentViewController:navVC animated:YES completion:nil];
    
}

#pragma mark UITableViewDelegate and UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (_segmented.selectedSegmentIndex) {
        case 0:
            return 2;
            
            break;
        case 1:
            return 1;
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    switch (_segmented.selectedSegmentIndex) {
        case 0:
            
            cell.nameLabel.text = @"张三";

            break;
        case 1:
            cell.nameLabel.text = @"李四";
            
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageChatViewController *chatVC = [[MessageChatViewController alloc] init];
    [chatVC setHidesBottomBarWhenPushed:YES];
    
    chatVC.title = @"张三";
    
    [self.navigationController pushViewController:chatVC animated:YES];
}

#pragma mark 搜索框 UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {

    self.searchView.showsCancelButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchView.showsCancelButton = NO;
    [self.searchView resignFirstResponder];

}

@end
