//
//  MessageChatViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/22.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MessageChatViewController.h"
#import "MessageModel.h"
#import "MessageChatCell.h"

@interface MessageChatViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLine;
@property (weak, nonatomic) IBOutlet UITableView *chatView;

@property (weak, nonatomic) IBOutlet UITextField *messageText;
@property (nonatomic, strong) NSMutableArray *resultArray;
@end

@implementation MessageChatViewController

-(NSMutableArray *)resultArray{
    
    if (_resultArray == nil) {
        
        _resultArray = [NSMutableArray array];
        
    }
    
    return _resultArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultArray = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        
        MessageModel *model = [[MessageModel alloc] init];
        
        if (i == 2 || i == 5 || i == 8) {
            
            model.name = @"me";
            model.content = @"安科技是地方看见俺还是贷款纠徽见俺还是贷款纠纷安徽见俺还是贷款纠纷安徽的身份";
            
        }else{
            model.name = @"张三";
            model.content = @"安科技是地方看见俺还方看见俺还方看见俺还方看见俺还方看见俺还是贷款纠纷安徽的身份卡哈迪斯卡飞机发了多少。";
        }
        
        
        [_resultArray addObject:model];
    }
    
    //监听键盘高度
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasChange:) name:UIKeyboardWillShowNotification object:nil];
    
    self.chatView.backgroundColor = [UIColor clearColor];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:nil];
    rightBtn.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    
//    NSUInteger rowCount = [self.chatView numberOfRowsInSection:0];
//    
//    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:rowCount - 1 inSection:0];
//    
//    [self.chatView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
    
    
    self.chatView.contentOffset = CGPointMake(0, self.chatView.height + 60);
    
}

//监听键盘高度
- (void)keyboardWasChange:(NSNotification *)aNotification {
    
    
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.bottomLine.constant = kbSize.height;

    }];

    
    NSUInteger rowCount = [self.chatView numberOfRowsInSection:0];
    
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:rowCount - 1 inSection:0];
    
    [self.chatView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

//点击发送
- (IBAction)clickSendOut:(UIButton *)sender {
    
    
    if (self.messageText.text.length < 1) {
      
        return;
    }else{
        
        MessageModel *model = [[MessageModel alloc] init];
        
        model.name = @"me";
        model.content = self.messageText.text;
        
        [_resultArray addObject:model];
        
        
        [_chatView reloadData];
        
        self.messageText.text = nil;
        
        NSUInteger rowCount = [self.chatView numberOfRowsInSection:0];
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:rowCount-1 inSection:0];
        
        [self.chatView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        
    } 

}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageModel *model = [_resultArray objectAtIndex:indexPath.row];
    
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    
    CGSize size = [model.content boundingRectWithSize:CGSizeMake(180.0f, 20000.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return size.height + 50;
}


#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _resultArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageChatCell *cell = [[MessageChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChatCell"];
    
    MessageModel *model = _resultArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.model = model;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
