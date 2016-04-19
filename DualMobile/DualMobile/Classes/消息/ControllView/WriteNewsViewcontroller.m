//
//  WriteNewsViewcontroller.m
//  DualMobile
//
//  Created by QUAN on 16/4/19.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "WriteNewsViewcontroller.h"

@interface WriteNewsViewcontroller ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *messageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLine;

@end

@implementation WriteNewsViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackItem)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    
    //监听键盘高度
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasChange:) name:UIKeyboardWillShowNotification object:nil];
    
}

- (void)keyboardWasChange:(NSNotification *)aNotification {
    
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.bottomLine.constant = kbSize.height;
        
    }];
    
//    if (kbSize.height == 225) {
//        
//       
//    }
//    else if(kbSize.height == 258){
//        
//        [UIView animateWithDuration:0.3f animations:^{
//
//        self.bottomLine.constant = kbSize.height;
//        
//        }];
//    }
//    
    
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomLine.constant = 0;
    }];
    
}

//返回
-(void) clickBackItem {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
