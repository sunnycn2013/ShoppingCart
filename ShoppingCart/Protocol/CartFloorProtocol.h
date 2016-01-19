//
//  CartFloorProtocol.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/13.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#ifndef CartFloorProtocol_h
#define CartFloorProtocol_h

@protocol CartRenderProtocol;
@protocol CartFloorProtocol <NSObject,CartRenderProtocol>
@required
/**
 *  一个大楼层的counts
 *
 *  @return 返回大楼层的count(当前section的count)
 */
- (NSInteger)numberOfModelInFloor;

/**
 *  获取单元下面的渲染对象
 *
 *  @param indexPath indexPath
 *
 *  @return id<CartRenderProtocol>
 */
- (id<CartRenderProtocol>)modelForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  获取对应的NSIndexPath下对应的Model
 *
 *  @param indexPath indexPath
 *
 *  @return 返回一个需要渲染的Model对象
 */
- (id<CartRenderProtocol>)modelForHeaderAtIndexPath:(NSInteger)index;
@end
#endif /* CartFloorProtocol_h */
