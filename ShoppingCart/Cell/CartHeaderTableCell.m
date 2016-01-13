//
//  CartHeaderCell.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartHeaderTableCell.h"

@interface CartHeaderTableCell ()

@property (nonatomic,strong) UILabel *titleLabel;
@end
@implementation CartHeaderTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return  self;
}

- (void)setUI
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 40)];
    _titleLabel.text = @"京东自营";
    [self.contentView addSubview:_titleLabel];
}

#pragma mark - CartProbeProtocol

+ (CGFloat)calculateSizeWithData:(id<CartRenderProtocol>)data
{
    return 40;
}

- (void)processData:(id<CartRenderProtocol>)data
{
    
}


@end
