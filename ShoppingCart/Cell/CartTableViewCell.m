//
//  CartTableViewCell.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartTableViewCell.h"
#import "CartSkuModel.h"

static CGFloat const CartCellHeight = 100.0;

@interface CartTableViewCell ()
{
    UIView *_bottomLine;
    BOOL   _isSelected;
}

@property (nonatomic,strong) UIButton *statusView;

@property (nonatomic,strong) UIImageView *titleImage;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *numberLabel;

@property (nonatomic,strong) CartSkuModel *skuModel;
@property (nonatomic,strong) NSIndexPath *indexPath;
@end
@implementation CartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _isSelected = NO;
    }
    return  self;
}

- (void)setUI
{
    _statusView = [UIButton buttonWithType:UIButtonTypeCustom];
    _statusView.frame = CGRectMake(5,38, 24, 24);  //70 -12
    [_statusView setImage:[UIImage imageNamed:@"ic_cb_normal"] forState:UIControlStateNormal];
    [_statusView addTarget:self action:@selector(selectedHead:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_statusView];
    
    _titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_statusView.frame), 12, 70, 70)];
    _titleImage.layer.cornerRadius = 2;
    _titleImage.layer.borderWidth = 1;
    _titleImage.layer.borderColor = [UIColor colorFromHexRGB:@"e2e2e2"].CGColor;
    [self.contentView addSubview:_titleImage];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleImage.frame)+7, 0, 200, 40)];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_titleLabel];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, CGRectGetMaxY(_titleLabel.frame)+7, 70, 20)];
    _priceLabel.text = @"$ 100.02";
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    _priceLabel.font = [UIFont systemFontOfSize:12];
    [_priceLabel setTextColor:[UIColor lightGrayColor]];
    [self.contentView addSubview:_priceLabel];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CartCellHeight - 0.5, SCREEN_WIDTH, HALF_PX)];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_bottomLine];
}

- (void)selectedHead:(UIButton *)sender
{
    NSString *imgName = _isSelected ? @"ic_cb_normal" : @"ic_cb_checked";
    _isSelected = ! _isSelected;
    self.skuModel.isSelected = [NSNumber numberWithBool:_isSelected];
    [_statusView setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if ([self.delegate respondsToSelector:@selector(cartView:didTagSelectedAtIndexPath:)]) {
        [self.delegate cartView:self didTagSelectedAtIndexPath:_indexPath];
    }
}
#pragma mark - CartProbeProtocol

+ (CGFloat)calculateSizeWithData:(id<CartRenderProtocol>)data
{
    return CartCellHeight;
}

- (void)transferData:(id<CartRenderProtocol>)data indexPath:(NSIndexPath *)indexPath;
{
    self.skuModel = (CartSkuModel *)data;
    self.indexPath = indexPath;
}

- (void)processData:(id<CartRenderProtocol>)data
{
    [_titleImage setImageWithURL:[NSURL URLWithString:self.skuModel.image]];
    if (![self.skuModel.isSelected boolValue]) {
        [_statusView setImage:[UIImage imageNamed:@"ic_cb_normal"] forState:UIControlStateNormal];
    }else{
        [_statusView setImage:[UIImage imageNamed:@"ic_cb_checked"] forState:UIControlStateNormal];
    }
    [_titleLabel setText:[NSString stringWithFormat:@"1- %@",self.skuModel.title]];
}

@end
