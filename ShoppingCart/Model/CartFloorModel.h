//
//  CartFloorModel.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartSkuModel.h"
#import "CartHeaderModel.h"
#import "CartModel.h"

@interface CartFloorModel : CartModel

@property (nonatomic,strong) NSMutableArray<CartSkuModel *> *list;
@property (nonatomic,strong) CartHeaderModel *headerModel;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
