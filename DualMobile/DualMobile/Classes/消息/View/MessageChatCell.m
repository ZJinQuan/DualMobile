//
//  MessageChatCell.m
//  DualMobile
//
//  Created by QUAN on 16/4/22.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "MessageChatCell.h"

@interface MessageChatCell ()

@property(nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) NSMutableArray *resultArray;

@end

@implementation MessageChatCell

-(NSMutableArray *)resultArray{
    
    if (_resultArray == nil) {
        
        _resultArray = [NSMutableArray array];
        
    }
    return _resultArray;
}

-(void)setModel:(MessageModel *)model{
    
    _model = model;
    
    
    self.timeLabel.text = model.name;
    
    if ([self.model.name isEqualToString:@"me"]) {
        
        self.timeLabel.text = @"12:00";
        
        [self addSubview:[self bubbleView:self.model.content from:YES withPosition:0]];
        
    }else{
        
        self.timeLabel.text = @"11:00";
        
        [self addSubview:[self bubbleView:self.model.content from:NO withPosition:0]];
        
    }
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor= [UIColor clearColor];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
        
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.timeLabel];
        
//        if ([self.model.name isEqualToString:@"rhl"]) {
//            
//            self.timeLabel.text = @"12:00";
//            
//            [self addSubview:[self bubbleView:self.model.content from:YES withPosition:0]];
//            
//        }else{
//            
//            self.timeLabel.text = @"11:00";
//            
//            [self addSubview:[self bubbleView:self.model.content from:NO withPosition:0]];
//            
//        }
    }
    
    return self;
}

//泡泡文本
- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf withPosition:(int)position{
    
    //计算大小
    UIFont *font = [UIFont systemFontOfSize:14];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    // build single chat bubble cell with given text
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    returnView.backgroundColor = [UIColor clearColor];
    
    //背影图片
    UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fromSelf?@"SenderAppNodeBkg_HL":@"ReceiverTextNodeBkg" ofType:@"png"]];
    
    //    UIImage *bubble = [UIImage imageNamed: fromSelf ? @"shape_chat" : @"shape_chat1"];
    
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:floorf(bubble.size.width/2) topCapHeight:floorf(bubble.size.height/2)]];
    
    
    //添加文本信息
    UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(fromSelf ? 15.0f : 22.0f, 25.0f, size.width+10, size.height+10)];
    bubbleText.backgroundColor = [UIColor clearColor];
    bubbleText.font = font;
    bubbleText.numberOfLines = 0;
    bubbleText.lineBreakMode = NSLineBreakByWordWrapping;
    bubbleText.text = text;
    
    bubbleImageView.frame = CGRectMake( 0, 20.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height + 20.0f);
    
    if(fromSelf){
        
        returnView.frame = CGRectMake(kScreenWidth - position-(bubbleText.frame.size.width+30.0f), 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
        
    }else{
        
        returnView.frame = CGRectMake(position, 0.0f, bubbleText.frame.size.width + 30.0f, bubbleText.frame.size.height + 30.0f);
        
    }
    
    [returnView addSubview:bubbleImageView];
    [returnView addSubview:bubbleText];
    
    return returnView;
}


@end
