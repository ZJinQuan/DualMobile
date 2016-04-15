//
//  ImportViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ImportViewController.h"
#import "TabBarController.h"

@interface ImportViewController ()
@property (weak, nonatomic) IBOutlet UILabel *promptLab;

@end

@implementation ImportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.promptLab.text = self.logId;
    
    self.title = @"导入通讯录";
    
    
}
- (IBAction)clickNoBtn:(id)sender {
    
    TabBarController *tabVC = [[TabBarController alloc] init];
    
    [self presentViewController:tabVC animated:YES completion:nil];
}

@end
