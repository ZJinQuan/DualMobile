//
//  AddressBookModel.h
//  DualMobile
//
//  Created by QUAN on 16/4/18.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBookModel : NSObject
//{
//    NSInteger sectionNumber;
//    NSInteger recordID;
//    NSString *name;
//    NSString *email;
//    NSString *tel;
//}
//@property NSInteger sectionNumber;
//@property NSInteger recordID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *tel;
@property (nonatomic, assign) NSInteger recordID;

@property (nonatomic, strong) NSData *userImage;

@end
