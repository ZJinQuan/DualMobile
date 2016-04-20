//
//  DetailsViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/20.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNum;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.model.name;
    self.phoneNum.text = self.model.tel;
    
    if (self.model.userImage == nil) {
        self.iconImage.image = [UIImage imageNamed:@"icon_head"];
    }else{
        self.iconImage.image = [UIImage imageWithData:self.model.userImage];
    }
    
    
}



@end
