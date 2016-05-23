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

@property (nonatomic, strong) UIView *enditView;

@property (nonatomic, strong) UIBarButtonItem *leftBtn;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    
    
    self.searchView.delegate = self;
    
    self.messageTableView.dataSource = self;
    self.messageTableView.delegate = self;
    self.messageTableView.backgroundColor = RGBA(250, 250, 250, 1);
    self.messageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //自定义cell
    [self.messageTableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:nil] forCellReuseIdentifier:@"MessageCell"];
    
    //设置导航栏的按钮
    [self initNavBarBtn];

    self.navigationItem.titleView = self.segmented;
    
//    [self.segmented addTarget:self action:@selector(clickSwitch:) forControlEvents:UIControlEventValueChanged];
}

-(UISegmentedControl *)segmented{
    
    if (_segmented == nil) {

        NSArray *segArr = [[NSArray alloc] initWithObjects:@"副卡1",@"副卡2", nil];
        
        _segmented = [[UISegmentedControl alloc] initWithItems:segArr];
        _segmented.frame = CGRectMake(0, 0, 150, 30);
        _segmented.selectedSegmentIndex = 0;
        
        [_segmented addTarget:self action:@selector(clickSwitch:) forControlEvents:UIControlEventValueChanged];
        
    }
    
    return _segmented;
}

-(void) clickSwitch:(UISegmentedControl *)seg{
    
    switch (seg.selectedSegmentIndex) {
        case 0:{
            
            self.leftBtn.title = @"编辑";
            
            NSLog(@"副卡1");
            [self.messageTableView reloadData];
            [self.messageTableView setEditing:NO animated:YES];
        }
        break;
            
        case 1:{
            
            self.leftBtn.title = @"编辑";
            
            NSLog(@"副卡2");
            [self.messageTableView setEditing:NO animated:YES];
            
            [self.messageTableView reloadData];
        }
        break;
            
        default:
            break;
    }
    
}

//这只导航栏 
-(void) initNavBarBtn{
    
    //编辑
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEdit:)];
    
    leftBtn.tintColor = [UIColor blackColor];
    
    [leftBtn setTitleTextAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.leftBtn = leftBtn;
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    //写消息
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"写信息" style:UIBarButtonItemStylePlain target:self action:@selector(clickWriteNews)];
    
    rightBtn.tintColor = [UIColor blackColor];
    
    [rightBtn setTitleTextAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15] } forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

//点击编辑
-(void) clickEdit:(UIBarButtonItem *)sender{
 
    if (self.messageTableView.editing) {
        
        sender.title = @"编辑";
        [self.messageTableView setEditing:NO animated:YES];
        NSLog(@"取消");

    }else{
        
        [self.messageTableView setEditing:YES animated:YES];
        sender.title = @"取消";
        NSLog(@"编辑");
        
    }
}

//发消息
-(void) clickWriteNews{
    NSLog(@"发消息");
    
    self.leftBtn.title = @"编辑";
    
    [self.messageTableView setEditing:NO animated:YES];
    
    WriteNewsViewcontroller *writeVC = [[WriteNewsViewcontroller alloc] init];
    
    writeVC.title = @"新信息";
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:writeVC];
    
    [self presentViewController:navVC animated:YES completion:nil];
    
}

#pragma mark UITableViewDelegate and UITableViewDataSource

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}


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
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    
    UIView *view = [[UIView alloc] initWithFrame:cell.frame];
    
    cell.selectedBackgroundView = view;
    cell.selectedBackgroundView.backgroundColor = RGBA(241, 145, 73, 0.1);
    
    cell.highlighted = YES;
    
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
    
    if (tableView.editing) {
        
    }else{
        
        MessageChatViewController *chatVC = [[MessageChatViewController alloc] init];
        [chatVC setHidesBottomBarWhenPushed:YES];
        
        chatVC.title = @"张三";
        
        [self.navigationController pushViewController:chatVC animated:YES];
    }
    
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
