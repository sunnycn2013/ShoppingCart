//
//  CartAPI.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartAPI.h"

@interface CartAPI ()
{
    kCartActionType _actionType;
    NSInteger _cartId;
}

@end
@implementation CartAPI

- (instancetype)initWithActionType:(kCartActionType)type CartID:(NSInteger)cartId
{
    self = [super init];
    if (self) {
        _actionType = type;
        _cartId = cartId;
    }
    return self;
}

- (NSString *)serverURL
{
    return @"http://www.baidu.com";
}

- (NSString *)functionID
{
    return @"functionid";
}

- (NSDictionary *)params
{
    return @{};
}

@end
