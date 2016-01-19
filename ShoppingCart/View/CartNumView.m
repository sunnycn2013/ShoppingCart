//
//  CartNumView.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/16.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartNumView.h"

@interface CartNumView ()

@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UIButton *minusButton;
@property (nonatomic, strong) UITextField  *numberFiled;
@property (nonatomic, assign) NSInteger choosedCount;
@property (nonatomic, assign) NSInteger totalCount;

@end

@implementation CartNumView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setUI
{
    _plusButton = [UIButton buttonWithType:UIButtonTypeCustom]; //58 54
    _plusButton.frame = CGRectMake(0, 0, 29, 27);
    [_plusButton setBackgroundImage:[UIImage imageNamed:@"product_detail_sub_normal"] forState:UIControlStateNormal];
    [_plusButton setBackgroundImage:[UIImage imageNamed:@"product_detail_sub_no"] forState:UIControlStateDisabled];
    _plusButton.exclusiveTouch = YES;
    [self addSubview:_plusButton];
    
    _numberFiled = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_plusButton.frame), 0, 40,CGRectGetHeight(_plusButton.frame))];
    _numberFiled.textAlignment=NSTextAlignmentCenter;
    _numberFiled.keyboardType=UIKeyboardTypeNumberPad;
    _numberFiled.clipsToBounds = YES;
    _numberFiled.layer.borderColor = [[UIColor colorFromHexRGB:@"dddddd"] CGColor];
    _numberFiled.layer.borderWidth = 0.5;
    _numberFiled.textColor = [UIColor colorFromHexRGB:@"333333"];
    _numberFiled.font=[UIFont systemFontOfSize:13];
    _numberFiled.backgroundColor = [UIColor whiteColor];
    [self addSubview:_numberFiled];
    
    
}

@end
