//
//  CartHeaderCell.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartHeaderTableCell.h"
#import "CartHeaderModel.h"

static CGFloat const CartHeaderHeight = 40.0;

@interface CartHeaderTableCell (){
    UIView *_bottomLine;
    BOOL   _isSelected;
}

@property (nonatomic,strong) UIButton * statusView;
@property (nonatomic,strong) UILabel  * titleLabel;
@property (nonatomic,strong) CartHeaderModel  * headModel;
@property (nonatomic,strong) NSIndexPath *indexPath;

@end
@implementation CartHeaderTableCell

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
    _statusView.frame = CGRectMake(5, 8, 24, 24);
    [_statusView setImage:[UIImage imageNamed:@"ic_cb_normal"] forState:UIControlStateNormal];
    [_statusView addTarget:self action:@selector(selectedHead:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_statusView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCALE_IPHONE6(30), 0, SCALE_IPHONE6(200), CartHeaderHeight)];
    _titleLabel.text = @"京东自营Header";
    [self.contentView addSubview:_titleLabel];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CartHeaderHeight - 0.5, SCREEN_WIDTH, HALF_PX)];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_bottomLine];
}

#pragma mark - Private Method
- (void)selectedHead:(UIButton *)sender
{
    NSString *imgName = _isSelected ? @"ic_cb_normal" : @"ic_cb_checked";
    _isSelected = ! _isSelected;
    self.headModel.isSelected = [NSNumber numberWithBool:_isSelected];
    [_statusView setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if ([self.delegate respondsToSelector:@selector(cartHeader:didTagSelectedAtIndexPath:)]) {
        [self.delegate cartHeader:self didTagSelectedAtIndexPath:_indexPath];
    }
}

#pragma mark - CartProbeProtocol

+ (CGFloat)calculateSizeWithData:(id<CartRenderProtocol>)data
{
    return CartHeaderHeight;
}

- (void)transferData:(id<CartRenderProtocol>)data indexPath:(NSIndexPath *)indexPath;
{
    self.headModel = (CartHeaderModel *)data;
    self.indexPath = indexPath;
}

- (void)processData:(id<CartRenderProtocol>)data
{

}

@end
