//
//  CartHeaderModel.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartHeaderModel.h"

@implementation CartHeaderModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setWithDic:dic];
    }
    return self;
}

- (void)setWithDic:(NSDictionary *)dic
{
    self.title      = JSON_PARSE(dic[@"title"], [NSString class]);
    self.isSelected = JSON_PARSE(dic[@"isSelected"], [NSNumber class]);
}

- (NSString *)headerIdentifier
{
    return @"CartHeaderTableCell";
}

@end
