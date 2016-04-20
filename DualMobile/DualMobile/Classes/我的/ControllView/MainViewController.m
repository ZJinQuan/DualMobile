//
//  MainViewController.m
//  DualMobile
//
//  Created by QUAN on 16/4/15.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBarBtn];
}

-(void) initNavBarBtn{
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_electric"] style:UIBarButtonItemStylePlain target:nil action:nil];
    leftBtn.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(clickTakePictures)];
    rightBtn.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

-(void)clickTakePictures{
    NSLog(@"拍照");
}
@end
