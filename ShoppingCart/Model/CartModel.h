//
//  CartModel.h
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartProtocol.h"

@interface CartModel : NSObject<CartFloorProtocol>

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
