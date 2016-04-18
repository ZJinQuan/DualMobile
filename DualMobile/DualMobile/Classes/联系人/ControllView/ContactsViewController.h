//
//  ContactsViewController.h
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressBookModel.h"

@interface ContactsViewController : BaseViewController

@property (strong, nonatomic) NSMutableArray *dataSource;/**<排序前的整个数据源*/

@end
