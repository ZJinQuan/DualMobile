//
//  MessageModel.h
//  DualMobile
//
//  Created by QUAN on 16/4/25.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
// 枚举类型，
typedef enum{
    
    SLQMessageTypeMe = 0,
    SLQMessageTypeOther = 1
    
}SLQMessageType;


@interface MessageModel : BaseModel

/*内容*/
@property (strong, nonatomic) NSString *content;
/*时间*/
@property (strong, nonatomic) NSString *name;
/*类型*/
//@property (assign, nonatomic) SLQMessageType type;
///*cellHeight*/
//@property (assign, nonatomic) CGFloat cellHeight;
///*是否隐藏时间*/
//@property (assign, nonatomic,getter=isHideTime) BOOL hideTime;

@end
