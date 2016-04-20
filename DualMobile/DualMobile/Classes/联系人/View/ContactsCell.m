//
//  ContactsCell.m
//  DualMobile
//
//  Created by QUAN on 16/4/18.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "ContactsCell.h"

@interface ContactsCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation ContactsCell

-(void)setModel:(AddressBookModel *)model{
    _model = model;
    
    self.nameLabel.text = model.name;
    
    if (model.userImage == nil) {
        self.iconImage.image = [UIImage imageNamed:@"icon_head"];
        
    }else{
        self.iconImage.image =[UIImage imageWithData:model.userImage];
    }
    
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
