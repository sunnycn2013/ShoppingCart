//
//  CartSkuModel.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartSkuModel.h"

@implementation CartSkuModel
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
    self.title       = JSON_PARSE(dic[@"title"], [NSString class]);
    self.descriptions = JSON_PARSE(dic[@"descriptions"], [NSString class]);
    self.price       = JSON_PARSE(dic[@"price"], [NSString class]);
    self.number      = JSON_PARSE(dic[@"number"], [NSNumber class]);
    self.isPhoneSp   = JSON_PARSE(dic[@"isPhoneSp"], [NSNumber class]);
    self.image       = JSON_PARSE(dic[@"image"], [NSString class]);
    self.isSelected  = JSON_PARSE(dic[@"isSelected"], [NSNumber class]);
}

- (NSString *)cellIdentifier
{
    return @"CartTableViewCell";
}

@end
