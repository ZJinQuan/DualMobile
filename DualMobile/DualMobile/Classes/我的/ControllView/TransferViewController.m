//
//  TransferViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/21.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "TransferViewController.h"

@interface TransferViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *transferView;

@property (nonatomic, strong) UISwitch *kaiguan;

@property (nonatomic, strong) UISwitch *kaiguan1;

@property (nonatomic, getter=isOn) BOOL on;

@property (nonatomic, getter=isOn) BOOL on1;

@end

@implementation TransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transferView.dataSource = self;
    self.transferView.delegate = self;
    self.transferView.backgroundColor = [UIColor clearColor];
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12;
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:{
            
            
            if (self.on) {
                return 4;
                
                
            }else{
                return 0;
            }


        }
            break;
            
        case 2:
            
            return 1;
            
            break;
            
        case 3:{
            
            if (self.on1) {
                return 4;
            }else{
                return 0;
            }
            
            
        }

            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    self.kaiguan = [[UISwitch alloc] init];
    self.kaiguan.tag = 1111;
    [self.kaiguan addTarget:self action:@selector(kaiguan:) forControlEvents:UIControlEventValueChanged];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    [btn setImage:[UIImage imageNamed:@"me_btn_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"me_btn_s"] forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(kaiguan:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if (self.on) {
        [self.kaiguan setOn:self.on animated:YES];
    }
    
    self.kaiguan1 = [[UISwitch alloc] init];
    self.kaiguan1.tag = 2222;
    [self.kaiguan1 addTarget:self action:@selector(kaiguan:) forControlEvents:UIControlEventValueChanged];
    
    if (self.on1) {
        [self.kaiguan1 setOn:self.on1 animated:YES];
    }
    
    switch (indexPath.section) {
        case 0:
            
            cell.textLabel.text = @"副卡1呼叫转移";
            cell.accessoryView = btn;
            
            
            
            break;
        case 1:
            
            break;
        case 2:
            
            cell.textLabel.text = @"副卡2呼叫转移";
            cell.accessoryView = btn;
            
            break;
        case 3:
            
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

-(void) kaiguan:(UIButton *)sender {
    
    if (sender.selected) {
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
    
}


//-(void)kaiguan:(UISwitch *)sender{
// 
//    
//    switch (sender.tag) {
//        case 1111:
//            
//            if (sender.on) {
//                
//                self.on = sender.on;
//                
//                [_transferView reloadData];
//                
//                
//            }else{
//                [_transferView reloadData];
//            }
//
//            break;
//        case 2222:
//            
//            if (sender.on) {
//                
//                self.on1 = sender.on;
//                
//                [_transferView reloadData];
//                
//                
//            }else{
//                [_transferView reloadData];
//            }
//            
//            break;
//            
//        default:
//            break;
//    }
//    
//    
//    
//}


@end
