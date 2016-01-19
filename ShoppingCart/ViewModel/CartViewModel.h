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

//实体Entity集合 主要暴漏给控制器使用
@property (nonatomic,strong) NSMutableArray<CartFloorProtocol> * list;

@property (nonatomic,assign) NSInteger productCount;

@property (nonatomic,assign) double totalPrice;

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

/**
 *  在服务端更新某个数据
 *
 *  @param skuNum skuNum
 */
- (void)updateProductWithSku:(NSString *)skuNum;

/**
 *  移除本地的某一行数据
 *
 *  @param indexPath indexPath
 *
 *  @return bool
 */
- (BOOL)removeObjectAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  移除本地数据
 *
 *  @param indexPath  indexPath
 *  @param completion block
 *
 *  @return bool
 */
- (BOOL)removeObjectAtIndexPath:(NSIndexPath *)indexPath completionBlock:(void (^)(BOOL deleteSection))completion;

@end
