//
//  ContactsViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ContactsViewController.h"
#import "ZYPinYinSearch.h"
#import "ChineseString.h"
#import "ContactsCell.h"
#import "AddPeopleViewController.h"
#import <AddressBook/AddressBook.h>
#import "AddressBookModel.h"
#import "DetailsViewController.h"
#import "PopMenuView.h"

#define kColor [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];

@interface ContactsViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *addressBookTemp;

@property (strong, nonatomic) UITableView *friendTableView;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *allDataSource;/**<排序后的整个数据源*/
@property (strong, nonatomic) NSMutableArray *searchDataSource;/**<搜索结果数据源*/
@property (strong, nonatomic) NSArray *indexDataSource;/**<索引数据源*/
@property (assign, nonatomic) BOOL isSearch;

@property (nonatomic, strong) UIBarButtonItem *leftBtn;
@end

@implementation ContactsViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.navigationItem.title = @"全部联系人";
    
    [self initNavBarBtn];
    
    [self.view addSubview:self.friendTableView];
    [self.view addSubview:self.searchBar];
    
    self.dataSource = [NSMutableArray array];
    self.addressBookTemp = [NSMutableArray array];
    
    [self ABAddressBook];
    
    [self initData];
    
    [_friendTableView reloadData];

    
}
#pragma mark 点击事件
-(void) titleButtonClick:(UIButton *) sender {
    NSLog(@"%s",__func__);
    
    UITableView *customView = [[UITableView alloc] initWithFrame:CGRectMake(20, 12, 150, 160)];

    customView.tag = 4444;
    customView.bounces = NO;
    customView.delegate = self;
    customView.dataSource = self;
    
    //让customView 放到视图前面
    PopMenuView *men = [[PopMenuView alloc] initWithCustomView:customView];
    
    //显示的位置
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect rect = [sender convertRect:sender.bounds toView:window];
    
    [men showWithView:sender andX:CGRectGetMidX(rect) andY:CGRectGetMaxY(rect) + 15];
}






-(void) initNavBarBtn{
    
    //编辑
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEdit:)];
    leftBtn.tintColor = [UIColor blackColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.leftBtn = leftBtn;
    //添加
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAdd)];
    rightBtn.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    
    //设置titlView
    UIButton *title = [[UIButton alloc] init];
    [title setTitle:@"全部联系人" forState:UIControlStateNormal];
    
    [title setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    
    [title setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //添加监听事件
    [title addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = title;
}

-(void) clickEdit:(UIBarButtonItem *)sender{
    
    if (self.friendTableView.editing) {
        
        sender.title = @"编辑";
        [self.friendTableView setEditing:NO animated:YES];
        NSLog(@"取消");
        
    }else{
        
        [self.friendTableView setEditing:YES animated:YES];
        sender.title = @"取消";
        NSLog(@"编辑");
        
    }
}

-(void) clickAdd{
    NSLog(@"添加");
    
    [self.friendTableView setEditing:NO animated:YES];
    self.leftBtn.title = @"编辑";
    
    AddPeopleViewController *addVC = [[AddPeopleViewController alloc] init];
    
    addVC.title = @"添加联系人";
    
    [addVC setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init
- (void)initData {

    _dataSource = [self.addressBookTemp sortedArrayUsingComparator:^NSComparisonResult(AddressBookModel *m1, AddressBookModel *m2) {
        return [m1.name compare:m2.name];
    }];
    
    
    NSLog(@"%@",_dataSource);
    
    _searchDataSource = [NSMutableArray new];
    //获取索引的首字母
//    _indexDataSource = [ChineseString IndexArray:_dataSource];
//    //对原数据进行排序重新分组
//    _allDataSource = [ChineseString LetterSortArray:_dataSource];
    
//    NSMutableArray *dictArr = [NSMutableArray array];
//    for (int i = 0; i < _dataSource.count; i++) {
//        NSDictionary *dict = _dataSource[i];
//
//        NSString *ss= [dict objectForKey:@"name"];
//        
//        if ([dict objectForKey:@"name"] != nil) {
//            [dictArr addObject:dict];
//        }
//    }
    
    
}

- (UITableView *)friendTableView {
    if (!_friendTableView) {
        _friendTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.searchBar.height, kScreenWidth, kScreenHeight - 108) style:UITableViewStyleGrouped];
        _friendTableView.delegate = self;
        _friendTableView.dataSource = self;
        [_friendTableView registerNib:[UINib nibWithNibName:@"ContactsCell" bundle:nil] forCellReuseIdentifier:@"ContactsCell"];
    }
    return _friendTableView;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"搜索";
        _searchBar.showsCancelButton = NO;
    }
    return _searchBar;
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 4444) {
        return 40;
    }else{
        return 60;
    }
  
}

//头部索引标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    if (!_isSearch) {
//        return _indexDataSource[section];
//    }else {
//        return nil;
//    }
//}

////右侧索引列表
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    if (!_isSearch) {
//        return _indexDataSource;
//    }else {
//        return nil;
//    }
//}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    if (!_isSearch) {
//        return _indexDataSource.count;
//    }else {
//        return 1;
//    }
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (!_isSearch) {
//        return [_allDataSource[section] count];
//    }else {
//        return _searchDataSource.count;
//    }
    
    if (tableView.tag == 4444) {
        return 4;
    }else{
        return _dataSource.count;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (tableView.tag == 4444) {
        
        static NSString *cellIdentifier = @"cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSArray *arr = @[@"全部联系人",@"卡1联系人", @"卡2联系人", @"手机联系人"];
        
        cell.textLabel.text = arr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
 
        return cell;
    }else{
        
        ContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsCell"];
        
        UIView *view = [[UIView alloc] initWithFrame:cell.frame];
        
        cell.selectedBackgroundView = view;
        
        cell.selectedBackgroundView.backgroundColor = RGBA(241, 145, 73, 0.1);
        
        AddressBookModel *model = _dataSource[indexPath.row];
        
        if (!_isSearch) {
            //cell.nameLabel.text = _allDataSource[indexPath.section][indexPath.row];
            cell.model = model;
            
        }else{
            //cell.nameLabel.text = _searchDataSource[indexPath.row];
        }
        return cell;

    }
    return nil;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.editing) {
        
        
        
    }else{
        
        if (tableView.tag == 4444) {
            
            UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            
        }else{
            
            AddressBookModel *model = _dataSource[indexPath.row];
            
            DetailsViewController *detailVC = [[DetailsViewController alloc] init];
            
            detailVC.model = model;
            
            detailVC.title = @"联系人详情";
            
            [detailVC setHidesBottomBarWhenPushed:YES];
            
            [self.navigationController pushViewController:detailVC animated:YES];
        }
        
    }

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryNone];

    
}

//索引点击事件
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
//    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    return index;
//}



#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [_searchDataSource removeAllObjects];
    NSArray *ary = [NSArray new];
    ary = [ZYPinYinSearch searchWithOriginalArray:_dataSource andSearchText:searchText andSearchByPropertyName:@"name"];
    if (searchText.length == 0) {
        _isSearch = NO;
        [_searchDataSource addObjectsFromArray:_allDataSource];
        
    }else {
        _isSearch = YES;
        [_searchDataSource addObjectsFromArray:ary];
    }
    
    [self.friendTableView reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    _searchBar.showsCancelButton = YES;
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    _searchBar.showsCancelButton = NO;
    [_searchBar resignFirstResponder];
    _searchBar.text = @"";
    _isSearch = NO;
    [_friendTableView reloadData];
    
}


#pragma mark 获取通讯录
-(void) ABAddressBook{
    
    //新建一个通讯录类
    ABAddressBookRef addressBooks = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
        
    {
        addressBooks =  ABAddressBookCreateWithOptions(NULL, NULL);
        
        //获取通讯录权限
        
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBooks, ^(bool granted, CFErrorRef error){dispatch_semaphore_signal(sema);});
        
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        
        
    }else{
        
        addressBooks = ABAddressBookCreate();
        
    }
    
    //获取通讯录中的所有人
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBooks);
    //通讯录中人数
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBooks);
    
    
    
    //循环，获取每个人的个人信息
    for (NSInteger i = 0; i < nPeople; i++)
    {
        //新建一个addressBook model类
        AddressBookModel *addressBook = [[AddressBookModel alloc] init];
        //获取个人
        ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
        //获取个人名字
        CFTypeRef abName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        CFTypeRef abLastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        CFStringRef abFullName = ABRecordCopyCompositeName(person);
        
        NSString *nameString = (__bridge NSString *)abName;
        NSString *lastNameString = (__bridge NSString *)abLastName;
        
        //获取当前联系人头像图片
        NSData *userImage = (__bridge NSData*)(ABPersonCopyImageData(person));
        
        
        
        if ((__bridge id)abFullName != nil) {
            nameString = (__bridge NSString *)abFullName;
        } else {
            if ((__bridge id)abLastName != nil)
            {
                nameString = [NSString stringWithFormat:@"%@ %@", nameString, lastNameString];
            }
        }
        
        addressBook.name = nameString;
        
        //        [_dataSource addObject:nameString];
        
        NSLog(@"+++++++++%@",nameString);
        
        addressBook.recordID = (int)ABRecordGetRecordID(person);;
        
        addressBook.userImage = userImage;
        
        ABPropertyID multiProperties[] = {
            kABPersonPhoneProperty,
            kABPersonEmailProperty
        };
        
        NSInteger multiPropertiesTotal = sizeof(multiProperties) / sizeof(ABPropertyID);
        for (NSInteger j = 0; j < multiPropertiesTotal; j++) {
            ABPropertyID property = multiProperties[j];
            ABMultiValueRef valuesRef = ABRecordCopyValue(person, property);
            NSInteger valuesCount = 0;
            if (valuesRef != nil) valuesCount = ABMultiValueGetCount(valuesRef);
            
            if (valuesCount == 0) {
                CFRelease(valuesRef);
                continue;
            }
            //获取电话号码和email
            for (NSInteger k = 0; k < valuesCount; k++) {
                CFTypeRef value = ABMultiValueCopyValueAtIndex(valuesRef, k);
                switch (j) {
                    case 0: {// Phone number
                        addressBook.tel = (__bridge NSString*)value;
                        break;
                    }
                    case 1: {// Email
                        addressBook.email = (__bridge NSString*)value;
                        break;
                    }
                }
                CFRelease(value);
            }
            CFRelease(valuesRef);
        }
        //将个人信息添加到数组中，循环完成后addressBookTemp中包含所有联系人的信息
        [_addressBookTemp addObject:addressBook];
        
        
        
        if (abName) CFRelease(abName);
        if (abLastName) CFRelease(abLastName);
        if (abFullName) CFRelease(abFullName);
    }
    
}

@end
