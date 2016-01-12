//
//  CartProtocol.h
//  ShoppingCart
//
//  Created by ccguo on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CartRenderProtocol <NSObject>
/**
 *  返回需要渲染的cell className
 *
 *  @return Identifier
 */
- (NSString *)cellIdentifier;

/**
 *  返回需要渲染的header className
 *
 *  @return Identifier
 */
- (NSString *)headerIdentifier;

@end

@protocol CartFloorProtocol <NSObject>
@required
/**
 *  一个大楼层的counts
 *
 *  @return 返回大楼层的count(当前section的count)
 */
- (NSInteger)numberOfModelInFloor;

/**
 *  获取对应的NSIndexPath下对应的Model
 *
 *  @param indexPath indexPath
 *
 *  @return 返回一个需要渲染的Model对象
 */
- (id<CartRenderProtocol>)modelForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol CartActionProtocol <NSObject>

@optional

/**
 *  获取对应的action事件
 *
 *  @param indexPath indexpath
 *
 *  @return  返回对应的Action事件
 */
- (id<CartActionProtocol>)actionForRowAtIndexPath:(NSIndexPath *)indexPath;

@end