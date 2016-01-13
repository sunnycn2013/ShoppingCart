//
//  CartRenderProtocol.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/13.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#ifndef CartRenderProtocol_h
#define CartRenderProtocol_h

@protocol CartRenderProtocol <NSObject>
@optional
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

#endif /* CartRenderProtocol_h */
