//
//  VoiceViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/21.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "VoiceViewController.h"

@interface VoiceViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *voiceView;

@end

@implementation VoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.voiceView.dataSource = self;
    self.voiceView.delegate = self;
    self.voiceView.backgroundColor = [UIColor clearColor];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 12;
    }
    return 30;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        return @"音量";
    }
    
    return nil;
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 3;
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
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *arr = @[@"来电静音", @"震动", @"免提"];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    [btn setImage:[UIImage imageNamed:@"me_btn_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"me_btn_s"] forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(kaiguan:) forControlEvents:UIControlEventTouchUpInside];
    
    switch (indexPath.section) {
        case 0:{
            
            cell.textLabel.text = [NSString stringWithFormat:@"%@",arr[indexPath.row]];
            
            cell.accessoryView = btn;
            
        }
            break;
            
        case 1:
            
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

@end
