//
//  CartViewModel.h
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartModel.h"
#import "CartFloorModel.h"

@interface CartViewModel : NSObject

//实体Model 
@property (nonatomic,strong) CartModel * cartModel;

/**
 *  从server端获取所有的购物车信息
 */
- (void)fetchProduct;

/**
 *  从服务端删除商品
 *
 *  @param skuNum 商品sku
 */
- (void)deleteProductWithSku:(NSString *)skuNum;

//- (NSInteger)numberOfFloorsInModel;


@end
