//
//  CartAPI.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPI.h"

typedef NS_ENUM(NSUInteger,kCartActionType){
    kCartActionTypeFetch = 0,
    kCartActionTypeAdd,
    kCartActionTypeDel,
    kCartActionTypeUpdate,
};

@interface CartAPI : BaseAPI

- (instancetype)initWithActionType:(kCartActionType)type CartID:(NSInteger)cartId;
@end
