//
//  ChucklesViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/22.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ChucklesViewController.h"

@interface ChucklesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *chucklesView;

@end

@implementation ChucklesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.chucklesView.dataSource = self;
    self.chucklesView.delegate = self;
    self.chucklesView.backgroundColor = [UIColor clearColor];
    
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 0.1;
    }else{
        return 12;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        
        
        
    }
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
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
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    [btn setImage:[UIImage imageNamed:@"me_btn_delete"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    
    if (indexPath.section == 1) {
        cell.textLabel.text = @"添加...";
        cell.textLabel.textColor = RGB(241, 145, 73);
    }else{
        cell.textLabel.text = @"很抱歉, 我现在不方便接电话.";
        
        cell.accessoryView = btn;
        
    }

    
    return cell;
}

-(void) delete{
    NSLog(@"删除");
}
@end
