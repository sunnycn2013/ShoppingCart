//
//  CartViewModel.h
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartFloorProtocol.h"
#import "CartFloorModel.h"

@protocol CartFloorProtocol;
@interface CartViewModel : NSObject

//实体Entity
//@property (nonatomic,strong) CartFloorModel * cartModel;
@property (nonatomic,strong) NSMutableArray<CartFloorProtocol> * list;

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
