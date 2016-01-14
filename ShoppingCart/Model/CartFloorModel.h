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
#import "CartFloorProtocol.h"

@interface CartFloorModel : NSObject

@property (nonatomic,strong) NSMutableArray<CartSkuModel *> *list;
@property (nonatomic,strong) CartHeaderModel *headerModel;

@property (nonatomic,assign) NSInteger count;

- (instancetype)initWithDic:(NSDictionary *)dic;

- (void)removeObjectAtIndexPath:(NSInteger)index;

@end
