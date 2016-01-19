//
//  CartProbeProtocol.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/13.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#ifndef CartProbeProtocol_h
#define CartProbeProtocol_h

@protocol CartRenderProtocol;

typedef void(^TapBlock)(NSIndexPath *indexPath);

@protocol CartProbeProtocol <NSObject>
@property (nonatomic,weak) id delegate;
@required
/**
 *  计算当前cell高度
 *
 *  @param data 渲染的数据
 *
 *  @return 返回cell的高度
 */
+ (CGFloat)calculateSizeWithData:(id<CartRenderProtocol>)data;

/**
 *  process 数据
 *
 *  @param data 渲染数据
 */
- (void)processData:(id<CartRenderProtocol>)data;

/**
 *  初始化数据
 *
 *  @param data      data      Entity
 *  @param indexPath indexPath
 */
- (void)transferData:(id<CartRenderProtocol>)data indexPath:(NSIndexPath *)indexPath;

@optional
/**
 *  获取对应的action事件
 *
 *  @param indexPath indexPath
 *
 *  @return  返回对应的Action事件
 */
- (id)actionForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  设置处理回调block
 *
 *  @param tapBlock block
 */
- (void)tapBlock:(TapBlock)tapBlock;

@end

#endif /* CartProbeProtocol */
