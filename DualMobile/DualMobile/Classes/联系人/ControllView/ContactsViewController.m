//
//  ContactsViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchView;

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView.delegate = self;
    [self initNavBarBtn];
}

-(void) initNavBarBtn{
    
    //编辑
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEdit)];
    leftBtn.tintColor = [UIColor blackColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    //添加
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAdd)];
    rightBtn.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void) clickEdit{
    NSLog(@"编辑");
}

-(void) clickAdd{
    NSLog(@"添加");
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
