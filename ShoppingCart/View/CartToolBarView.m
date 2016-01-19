//
//  CartToolBarView.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/16.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartToolBarView.h"

@interface CartToolBarView ()

@property (nonatomic,strong) UIButton *statusView;
@property (nonatomic,strong) UILabel *desLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UIButton *balanceView;

@end

@implementation CartToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    _statusView = [UIButton buttonWithType:UIButtonTypeCustom];
    _statusView.frame = CGRectMake(5, 7, 24, 24);
    [_statusView setImage:[UIImage imageNamed:@"ic_cb_checked"] forState:UIControlStateNormal];
    [self addSubview:_statusView];
    
    _desLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_statusView.frame), 0, 60, 35)];
    _desLabel.text = @"取消全选";
    _desLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_desLabel];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_desLabel.frame), 0, 100, 35)];
    _priceLabel.font = [UIFont systemFontOfSize:14];
    _priceLabel.text = @"合计: 1000.0";
    [self addSubview:_priceLabel];
    
    _balanceView = [UIButton buttonWithType:UIButtonTypeCustom];
    _balanceView.frame = CGRectMake(SCREEN_WIDTH - 95, 0, 80, 30);
    _balanceView.backgroundColor=[UIColor redColor];
    [_balanceView addTarget:self action:@selector(balanceCart:) forControlEvents:UIControlEventTouchUpInside];
    [_balanceView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_balanceView];
}

- (void)balanceCart:(UIButton *)sender
{
    
}
@end
