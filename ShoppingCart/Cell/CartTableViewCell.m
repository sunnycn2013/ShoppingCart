//
//  CartTableViewCell.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartTableViewCell.h"


@interface CartTableViewCell ()

@property (nonatomic,strong) UIImageView *titleImage;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *desLabel;
@property (nonatomic,strong) UILabel *numberLabel;
@property (nonatomic,strong) UILabel *priceLabel;

@end
@implementation CartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return  self;
}

- (void)setUI
{
    _titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 150, 150)];
    [self.contentView addSubview:_titleImage];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 40)];
    _titleLabel.text = @"京东自营";
    [self.contentView addSubview:_titleLabel];
}
#pragma mark - CartProbeProtocol

+ (CGFloat)calculateSizeWithData:(id<CartRenderProtocol>)data
{
    return 140;
}

- (void)processData:(id<CartRenderProtocol>)data
{
    
}
@end
